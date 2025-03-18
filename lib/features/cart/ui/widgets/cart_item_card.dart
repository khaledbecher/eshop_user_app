import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop/common/app_widgets/custom_widgets/bounce.dart';
import 'package:eshop/common/constants/asset_paths.dart';
import 'package:eshop/features/cart/notifiers/cart_notifier.dart';
import 'package:eshop/features/home/ui/screens/product_detail_screen.dart';
import 'package:eshop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CartItemCard extends StatelessWidget {
  final Product product;
  final int quantity;
  final int index;
  final void Function()? onPlusPressed;
  final void Function()? onMinusPressed;

  const CartItemCard(
      {super.key,
      required this.quantity,
      required this.product,
      this.onMinusPressed,
      this.onPlusPressed,
      required this.index});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final notifier = Provider.of<CartNotifier>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Bounce(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                product: product,
              ),
            ),
          );
        },
        child: Dismissible(
          key: Key(product.title!),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            notifier.removeCartItem(index);
          },
          background: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: theme.colorScheme.primary,
            ),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(16.0),
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Icon(Icons.delete, color: theme.colorScheme.onError),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.secondary,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: product.images!.first,
                      height: 80,
                      width: 80,
                      fit: BoxFit.contain,
                      progressIndicatorBuilder:
                          (context, url, loadingProgress) {
                        return Center(
                            child: Container(
                          height: 80,
                          width: 80,
                          child: Lottie.asset(AssetPaths.kLoadingPath,
                              fit: BoxFit.fitHeight),
                        ));
                      },
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title!,
                            style: theme.textTheme.titleMedium,
                          ),
                          SizedBox(height: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '(${product.tags!.last})',
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                        color:
                                            theme.colorScheme.onSecondaryFixed),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '\$${(_calculateDiscountedPrice(product.price!, product.discountPercentage!) * quantity).toStringAsFixed(2)}',
                                    style: theme.textTheme.titleLarge,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      notifier.updateQuantity(
                                          index: index, offset: -1);
                                    },
                                    icon: Icon(Icons.remove_circle_outline),
                                  ),
                                  Text(
                                    '$quantity',
                                    style: theme.textTheme.titleLarge,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      notifier.updateQuantity(
                                          index: index, offset: 1);
                                    },
                                    icon: Icon(Icons.add_circle_outline),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

double _calculateDiscountedPrice(double price, double discount) {
  return price - (price * discount / 100);
}
