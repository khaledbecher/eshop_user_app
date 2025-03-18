import 'package:eshop/common/constants/app_constants.dart';
import 'package:eshop/common/shared_notifiers/adresses_notifier.dart';
import 'package:eshop/common/shared_notifiers/navigation_notifier.dart';
import 'package:eshop/common/shared_notifiers/orders_notifier.dart';
import 'package:eshop/common/shared_notifiers/user_notifier.dart';
import 'package:eshop/common/utils/interaction_utils/dialogs/success_dialog.dart';
import 'package:eshop/common/utils/services/local/secure_storage_service.dart';
import 'package:eshop/features/cart/notifiers/cart_notifier.dart';
import 'package:eshop/features/home/ui/screens/home_page.dart';
import 'package:eshop/features/settings/ui/screens/orders_screen.dart';
import 'package:eshop/models/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> addOrder(BuildContext context) async {
  final cartNotifier = Provider.of<CartNotifier>(context, listen: false);
  final ordersNotifier = Provider.of<OrdersNotifier>(context, listen: false);
  final adressesNotifier =
      Provider.of<AdressesNotifier>(context, listen: false);
  final navigationNotifier =
      Provider.of<NavigationNotifier>(context, listen: false);
  final userNotifier = Provider.of<UserNotifier>(context, listen: false);
  final userId = await SecureStorageService.getUid();
  await ordersNotifier.addOrder(
    Orderr(
        userId: userId,
        paymentMethod:
            AppConstants.paymentMethods[cartNotifier.paymentMethodIndex] ==
                    'Pay with card'
                ? 'Payed with card'
                : AppConstants.paymentMethods[cartNotifier.paymentMethodIndex],
        purchases: cartNotifier.cartItems,
        shippingAdress: adressesNotifier.adresses[adressesNotifier.adressIndex],
        status: 'Pending',
        price: cartNotifier.totalPrice.toStringAsFixed(2),
        clientPhone: userNotifier.user.phoneNumber),
  );
  cartNotifier.resetCart();
  showDialog(
    context: context,
    builder: (_) => SuccessDialog(
      message:
          'Your order has been confirmed !',
      buttonText: 'OK',
      onButtonPressed: () {
        navigationNotifier
            .changeNavItemIndex(AppConstants.navItems.indexOf('Home'));
        Navigator.popAndPushNamed(context, HomePage.routeName);
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => OrdersScreen()));
      },
    ),
  );
}
