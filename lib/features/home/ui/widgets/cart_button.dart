import 'package:eshop/common/app_widgets/cart_icon_with_budge.dart';
import 'package:eshop/common/shared_notifiers/navigation_notifier.dart';
import 'package:eshop/features/cart/ui/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: IconButton(
        icon: CartIconWithBudge(),
        onPressed: () {
          Provider.of<NavigationNotifier>(context, listen: false)
              .changeNavItemIndex(2);
          Navigator.pushNamed(context, CartScreen.routeName);
        },
      ),
    );
  }
}
