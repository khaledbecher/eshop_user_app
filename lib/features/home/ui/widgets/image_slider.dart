import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop/common/constants/asset_paths.dart';
import 'package:eshop/features/favorites/notifiers/favorites_notifier.dart';
import 'package:eshop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  final double screenHeight;
  final Product product;

  const ImageSlider(
      {super.key, required this.screenHeight, required this.product});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final List<dynamic> productImages = widget.product.images!;
    return Container(
      color: theme.colorScheme.secondary,
      height: widget.screenHeight * 0.4, // Adjust height based on your layout
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: productImages.length,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: productImages[index],
                width: double.infinity,
                fit: BoxFit.contain,
                progressIndicatorBuilder: (context, url, loadingProgress) {
                  return Center(
                      child: SizedBox(
                    height: widget.screenHeight * 0.4,
                    width: double.infinity,
                    child: Lottie.asset(AssetPaths.kLoadingPath,
                        fit: BoxFit.fitHeight),
                  ));
                },
              );
            },
          ),
          Positioned(
            bottom: 10,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: productImages.length,
              effect: ExpandingDotsEffect(
                activeDotColor: theme.colorScheme.primary,
                dotColor: theme.colorScheme.primary.withOpacity(.4),
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 2,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Selector<FavoritesNotifier, List>(
                selector: (_, notifier) => notifier.favorites,
                builder: (_, favorites, __) {
                  final favoritesNotifier =
                      Provider.of<FavoritesNotifier>(context, listen: false);
                  bool isFavorite = favorites.any((favorite)=> favorite.id == widget.product.id);
                  return IconButton(
                    onPressed: () => isFavorite
                        ? favoritesNotifier.removeFavorite(widget.product)
                        : favoritesNotifier.addFavorite(widget.product),
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
                  widget.product.rating.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontSize: 20,
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 25,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
