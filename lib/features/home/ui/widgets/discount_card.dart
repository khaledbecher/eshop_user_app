import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop/common/app_widgets/custom_widgets/custom_button.dart';
import 'package:eshop/common/app_widgets/discount_budge.dart';
import 'package:eshop/common/constants/asset_paths.dart';
import 'package:eshop/features/home/ui/screens/product_detail_screen.dart';
import 'package:eshop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class DiscountCard extends StatelessWidget {
  final Product product;
  final bool? isLoading;

  DiscountCard({
    Key? key,
    this.isLoading = false,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(top: 5, right: 8, left: 8, bottom: 8),
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: theme.colorScheme.onError,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.secondary,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: isLoading!
          ? _buildShimmerEffect()
          : _buildDiscountCardContent(context, theme),
    );
  }

  // Shimmer effect
  Widget _buildShimmerEffect() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            // Shimmer for Image
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  color: Colors.grey[300],
                ),
              ),
            ),
            // Shimmer for Discount
            Positioned(
              top: 8,
              left: 8,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 24,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            // Shimmer for Rate
            Positioned(
              top: 8,
              right: 8,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Row(
                  children: [
                    Container(
                      height: 20,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: Colors.grey[200],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Shimmer for Title
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 20,
                    width: 150,
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(height: 8),
                // Shimmer for Brand
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 16,
                    width: 100,
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(height: 16),
                // Shimmer for Button
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[300],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Normal content
  Widget _buildDiscountCardContent(BuildContext context, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            CachedNetworkImage(
              imageUrl: product.images!.first,
              height: 150,
              width: double.infinity,
              fit: BoxFit.contain,
              progressIndicatorBuilder: (context, url, loadingProgress) {
                return Center(
                    child: Container(
                  height: 150,
                  width: double.infinity,
                  child: Lottie.asset(AssetPaths.kLoadingPath,
                      fit: BoxFit.fitHeight,
                    delegates: LottieDelegates(
                      values: [
                        ValueDelegate.color(
                          const ['**'], // Target all color properties
                          value: theme.colorScheme.primary, // Change to your desired color
                        ),
                      ],
                    ),
                  ),
                ));
              },
            ),
            Positioned(
                top: 8,
                left: 8,
                child: DiscountBadge(
                    discountPercentage: product.discountPercentage!)),
            Positioned(
              top: 8,
              right: 8,
              child: Row(
                children: [
                  Text(
                    product.rating.toString(),
                    style: theme.textTheme.titleMedium,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: theme.colorScheme.secondary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  product.title!,
                  style: theme.textTheme.titleLarge,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '(${product.category!.replaceAll("-", " ")})',
                  style:
                      theme.textTheme.bodyMedium!.copyWith(color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                CustomButton(
                  theme: theme,
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
                  child: const Text('Get Now'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
