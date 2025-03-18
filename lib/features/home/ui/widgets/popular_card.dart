import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop/common/app_widgets/custom_widgets/bounce.dart';
import 'package:eshop/common/constants/asset_paths.dart';
import 'package:eshop/common/utils/other_utils/usefull_functions.dart';
import 'package:eshop/features/home/ui/screens/product_detail_screen.dart';
import 'package:eshop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class PopularCard extends StatelessWidget {
  final Product product;
  final bool? isLoading;

  const PopularCard({
    super.key,
    this.isLoading = false,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    if (isLoading == true) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 16,
                  width: 100,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Container(
                  height: 14,
                  width: 150,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Container(
                  height: 16,
                  width: 80,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      height: 16,
                      width: 16,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      height: 16,
                      width: 40,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Bounce(
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
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.secondary,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: product.images!.first,
              height: 80,
              width:80,
              fit: BoxFit.contain,
              progressIndicatorBuilder: (context, url, loadingProgress) {
                return Center(
                    child: Container(
                      height: 80,
                      width: 80,
                      child: Lottie.asset(AssetPaths.kLoadingPath,
                          fit: BoxFit.fitHeight),
                    ));
              },
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title!,
                      style: theme.textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '(${product.tags!.last})',
                      style: theme.textTheme.titleSmall!
                          .copyWith(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
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
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    size: 16, color: Colors.amber),
                                Text(product.rating.toString()),
                              ],
                            ),
                          ],
                        ),
                      ],
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
