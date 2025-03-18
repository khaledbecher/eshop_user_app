import 'package:badges/badges.dart' as badges;
import 'package:eshop/features/cart/notifiers/cart_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartIconWithBudge extends StatelessWidget {
  const CartIconWithBudge({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Selector<CartNotifier, int>(
        selector: (_, notifier) => notifier.cartItemCount,
        builder: (_, cartItemCount, __) {
          return badges.Badge(
            badgeContent: Text(
              cartItemCount.toString(),
              style: theme.textTheme.bodySmall!
                  .copyWith(color: theme.colorScheme.onError),
            ),
            showBadge: cartItemCount > 0,
            // Only show if cart is not empty
            position:
            badges.BadgePosition.topEnd(top: -10, end: -10),
            badgeStyle: badges.BadgeStyle(
              badgeColor: theme.colorScheme.onTertiaryFixed,
            ),
            child: Icon(Icons.shopping_cart),
          );
        });
  }
}
