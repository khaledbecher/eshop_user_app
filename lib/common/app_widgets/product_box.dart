import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop/common/app_widgets/custom_widgets/bounce.dart';
import 'package:eshop/common/constants/asset_paths.dart';
import 'package:eshop/common/utils/other_utils/usefull_functions.dart';
import 'package:eshop/features/favorites/notifiers/favorites_notifier.dart';
import 'package:eshop/features/home/notifiers/home_notifier.dart';
import 'package:eshop/features/home/ui/screens/product_detail_screen.dart';
import 'package:eshop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ProductBox extends StatelessWidget {
  final Product product;

  const ProductBox({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Bounce(
      onPressed: () {
        final notifier = Provider.of<HomeNotifier>(context, listen: false);
        notifier.clearFilter();
        notifier.setVisibleFilter(false);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              product: product,
            ),
          ),
        );
      }, // Disable interaction if loading
      child: Container(
        margin: EdgeInsets.only(top: 16, right: 8, left: 8),
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: theme.colorScheme.onError,
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.secondary,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],        ),
        child: // Show shimmer effect if loading
            Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: product.images!.first,
                  height: 120,
                  width:double.infinity,
                  fit: BoxFit.contain,
                  progressIndicatorBuilder: (context, url, loadingProgress) {
                    return Center(
                        child: SizedBox(
                          height: 120,
                          width:double.infinity,
                          child: Lottie.asset(AssetPaths.kLoadingPath,
                              fit: BoxFit.fitHeight),
                        ));
                  },
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Selector<FavoritesNotifier, List>(
                      selector: (_, notifier) => notifier.favorites,
                      builder: (_, favorites, __) {
                        final favoritesNotifier =
                            Provider.of<FavoritesNotifier>(context,
                                listen: false);
                        bool isFavorite = favorites.any((favorite)=> favorite.id == product.id);
                        return IconButton(
                          onPressed: () => isFavorite
                              ? favoritesNotifier.removeFavorite(product)
                              : favoritesNotifier.addFavorite(product),
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            size: 25,
                            color: isFavorite
                                ? theme.colorScheme.onTertiaryFixed
                                : theme.colorScheme.primary,
                          ),
                        );
                      }),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Row(
                    children: [
                      Text(
                        product.rating.toString(),
                        style: theme.textTheme.bodySmall!.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      )
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: theme.colorScheme.secondary,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      product.title!,
                      style: theme.textTheme.titleSmall!.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    Column(
                      children: [
                        if (product.discountPercentage! > 0) ...[
                          Text(
                            r'$' + product.price.toString(),
                            style: theme.textTheme.titleLarge!.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: theme.colorScheme.onSecondaryFixed,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            r'$' +
                                calculateDiscountedPrice(product.price!,
                                    product.discountPercentage!)
                                    .toStringAsFixed(2),
                            style: theme.textTheme.titleLarge!.copyWith(
                              fontSize: 20,
                            ),
                          ),
                        ] else
                          Text(
                            r'$' + product.price.toString(),
                            style: theme.textTheme.titleLarge!.copyWith(
                              fontSize: 20,
                            ),
                          ),
                      ],
                    ),
                    Text(
                      getAvailibility(product.stock!),
                      style: theme.textTheme.titleMedium!.copyWith(
                        overflow: TextOverflow.ellipsis,
                        color: availabilityColor(  getAvailibility(product.stock!)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
