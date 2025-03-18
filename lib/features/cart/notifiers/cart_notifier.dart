import 'package:eshop/common/constants/app_constants.dart';
import 'package:eshop/common/utils/interaction_utils/toasts/toast_utils.dart';
import 'package:eshop/common/utils/other_utils/usefull_functions.dart';
import 'package:eshop/features/cart/data/services/remote/cart_service.dart';
import 'package:eshop/features/cart/data/services/remote/stripe_service.dart';
import 'package:eshop/models/purchase.dart';
import 'package:flutter/material.dart';

class CartNotifier with ChangeNotifier {
  List<Purchase> _cartItems = [];
  int _cartItemCount = 0;
  List<int> _quantities = [];
  int _paymentMethodIndex = 0;
  double _subTotalPrice = 0;
  double _totalPrice = 0;

  List<Purchase> get cartItems => _cartItems;

  List<int> get quantities => _quantities;

  int get cartItemCount => _cartItemCount;

  int get paymentMethodIndex => _paymentMethodIndex;

  double get subTotalPrice => _subTotalPrice;

  double get totalPrice => _totalPrice;

  bool addCartItem(Purchase newItem) {
    final int index = _cartItems
        .indexWhere((item) => item.product!.id == newItem.product!.id);
    if (index != -1) {
      if (_cartItems[index].product!.stock! < newItem.quantity!) {
        showErrorToast(msg: 'The selected quantity isn\'t available');
        return false;
      }
      updateQuantity(index: index, offset: newItem.quantity!);
    } else {
      if (newItem.quantity! > newItem.product!.stock!) {
        showErrorToast(msg: 'The selected quantity isn\'t available');
        return false;
      }
      CartService.addPurchase(newItem);
      _cartItems.add(newItem);
      _quantities.add(newItem.quantity!);
      _cartItemCount++;
      updateTotalPrice();
      notifyListeners();
    }
    return true;
  }

  void updateQuantity({required int index, required int offset}) {
    int newQuantity = _cartItems[index].quantity! + offset;
    if (newQuantity >= 1) {
      CartService.updatePurchaseQuantity(
          purchase: _cartItems[index], offset: offset);
      _cartItems[index] = _cartItems[index].copyWith(quantity: newQuantity);
      _quantities.removeAt(index);
      _quantities.insert(index, newQuantity);
      _quantities = List.from(_quantities);
      updateTotalPrice();
      notifyListeners();
    }
  }

  void removeCartItem(int index) {
    CartService.removePurchase(_cartItems[index]);
    _cartItems.removeAt(index);
    _quantities.removeAt(index);
    _cartItemCount--;
    updateTotalPrice();
    notifyListeners();
  }

  static Future<List<Purchase>> fetchPurchases() async {
    final response = await CartService.fetchPurchases();
    List<Purchase> purchases =
        response.map((product) => Purchase.fromJson(product)).toList();
    return purchases;
  }

  void loadPurchases() async {
    _cartItems = await fetchPurchases();
    _cartItemCount = _cartItems.length;
    _quantities = _cartItems.map((element) => element.quantity!).toList();
    notifyListeners();
  }

  void updateTotalPrice() {
    double price = 0;
    _cartItems.forEach((item) {
      price = price +
          (calculateDiscountedPrice(
                  item.product!.price!, item.product!.discountPercentage!) *
              item.quantity!);
    });
    _subTotalPrice = price;
    _totalPrice = _subTotalPrice + AppConstants.shippingPrice;
  }

  void resetCart() {
    CartService.clearPurchases();
    _cartItems = [];
    _quantities = [];
    _cartItemCount = 0;
    _paymentMethodIndex = 0;
    _subTotalPrice = 0;
    _totalPrice = 0;
    notifyListeners();
  }

  void changePaymentMethodIndex(int newIndex) {
    if (_paymentMethodIndex == newIndex) {
      _paymentMethodIndex = -1;
    } else {
      _paymentMethodIndex = newIndex;
    }
    notifyListeners();
  }

  Future<void> makePayment(ThemeData theme, BuildContext ctx) async {
    try {
      await StripeService.instance.makePayment(_totalPrice, theme, ctx);
    } catch (e) {
      throw (e.toString());
    }
  }
}
