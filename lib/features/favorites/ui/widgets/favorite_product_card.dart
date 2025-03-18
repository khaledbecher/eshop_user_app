import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop/common/app_widgets/custom_widgets/bounce.dart';
import 'package:eshop/common/app_widgets/discount_budge.dart';
import 'package:eshop/common/constants/asset_paths.dart';
import 'package:eshop/common/utils/other_utils/usefull_functions.dart';
import 'package:eshop/features/favorites/notifiers/favorites_notifier.dart';
import 'package:eshop/features/home/ui/screens/product_detail_screen.dart';
import 'package:eshop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class FavoriteProductCard extends StatelessWidget {
  final Product product;

  const FavoriteProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final favoritesNotifier =
        Provider.of<FavoritesNotifier>(context, listen: false);
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
          key: Key(product.id.toString()),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            favoritesNotifier.removeFavorite(product);
          },
          background: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: theme.colorScheme.primary,
            ),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(16.0),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Product Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
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
                    ),
                    SizedBox(width: 16),

                    // Product Information
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title and Brand
                          Text(
                            product.title!,
                            style: theme.textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          SizedBox(height: 4),
                          Text(
                            '(${product.tags!.last})',
                            style: theme.textTheme.bodyMedium!.copyWith(
                                color: theme.colorScheme.onSecondaryFixed),
                          ),
                          SizedBox(height: 4),

                          // Price and Discount
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  if (product.discountPercentage! > 0) ...[
                                    Text(
                                      r'$' + product.price.toString(),
                                      style:
                                          theme.textTheme.titleLarge!.copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        color:
                                            theme.colorScheme.onSecondaryFixed,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      r'$' +
                                          calculateDiscountedPrice(
                                                  product.price!,
                                                  product.discountPercentage!)
                                              .toStringAsFixed(2),
                                      style:
                                          theme.textTheme.titleLarge!.copyWith(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ] else
                                    Text(
                                      r'$' + product.price.toString(),
                                      style:
                                          theme.textTheme.titleLarge!.copyWith(
                                        fontSize: 20,
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 4),

                          // Availability
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                getAvailibility(product.stock!),
                                style: theme.textTheme.titleMedium!.copyWith(
                                  color: availabilityColor(
                                      getAvailibility(product.stock!)),
                                ),
                              ),
                              if (product.discountPercentage! > 0)
                                DiscountBadge(
                                  discountPercentage:
                                      product.discountPercentage!,
                                )
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
