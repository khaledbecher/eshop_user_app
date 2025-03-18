import 'package:flutter/material.dart';

class PriceBox extends StatelessWidget {
  final double subTotal;
  final double shipping;
  final double bagTotal;
  final int quantity;

  const PriceBox(
      {super.key,
      required this.subTotal,
      required this.shipping,
      required this.bagTotal,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 3.0, color: theme.colorScheme.onSecondaryFixed)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPriceRow(title: 'Subtotal', value: subTotal, theme: theme),
          Divider(
            color: theme.colorScheme.onSecondaryFixed,
            thickness: 2,
          ),
          _buildPriceRow(title: 'Shipping', value: shipping, theme: theme),
          Divider(
            color: theme.colorScheme.onSecondaryFixed,
            thickness: 2,
          ),
          _buildPriceRow(
              title: 'BagTotal',
              value: bagTotal,
              itemsCount: quantity,
              theme: theme),
        ],
      ),
    );
  }
}

Widget _buildPriceRow(
    {required String title,
    int? itemsCount,
    required double value,
    required ThemeData theme}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: theme.textTheme.titleMedium,
      ),
      itemsCount != null
          ? Text(
              ' ($itemsCount item${itemsCount > 1 ? "s" : ""}) ',
              style: theme.textTheme.bodyMedium,
            )
          : SizedBox(),
      Text(
        ' :',
        style: theme.textTheme.titleMedium,
      ),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '\$${value.toStringAsFixed(2)}',
              style: theme.textTheme.titleLarge,
            ),
          ],
        ),
      ),
    ],
  );
}
