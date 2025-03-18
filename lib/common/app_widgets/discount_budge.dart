import 'package:flutter/material.dart';

class DiscountBadge extends StatelessWidget {
  final double discountPercentage;
  const DiscountBadge({super.key, required this.discountPercentage});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.onTertiary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '${discountPercentage.toString()}% OFF',
        style: theme.textTheme.titleSmall!.copyWith(color: theme.colorScheme.onTertiaryFixed),
      ),
    );
  }
}
