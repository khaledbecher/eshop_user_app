import 'dart:convert';

import 'package:eshop/common/constants/apis.dart';
import 'package:eshop/common/constants/keys.dart';
import 'package:eshop/features/cart/functions/cart_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();

  Future<void> makePayment(
      double amount, ThemeData theme, BuildContext ctx) async {
    try {
      String? paymentIntentClientSecret =
          await _createPaymentIntent(amount, 'usd');
      if (paymentIntentClientSecret == null) return;
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: 'e-shop',
          style: ThemeMode.light,
          allowsDelayedPaymentMethods: false,
          appearance: PaymentSheetAppearance(
            colors: PaymentSheetAppearanceColors(),
          ),
        ),
      );
      await _processPayment(ctx);
    } catch (e) {
      throw Exception('error making payment!$e');
    }
  }

  Future<String?> _createPaymentIntent(double amount, String currency) async {
    try {
      Map<String, dynamic> data = {
        'amount': _calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      var response = await http.post(
        Uri.parse(Apis.stripeApi),
        body: data,
        headers: {'Authorization': 'Bearer ${AppKeys.stripeSecretKey}'},
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData['client_secret'];
      }
      return null;
    } catch (e) {
      throw Exception('error creating payment intent!$e');
    }
  }

  Future<void> _processPayment(BuildContext ctx) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      addOrder(ctx);
      await Stripe.instance.confirmPaymentSheetPayment();
    } catch (e) {
      throw Exception('error presenting payment sheet!$e');
    }
  }

  String _calculateAmount(double amount) {
    final calculatedAmount = amount * 100;
    return calculatedAmount.toInt().toString();
  }
}
