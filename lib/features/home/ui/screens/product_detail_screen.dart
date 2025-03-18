import 'package:eshop/common/app_widgets/custom_widgets/custom_button.dart';
import 'package:eshop/common/app_widgets/discount_budge.dart';
import 'package:eshop/common/utils/interaction_utils/dialogs/success_dialog.dart';
import 'package:eshop/common/utils/other_utils/usefull_functions.dart';
import 'package:eshop/features/cart/notifiers/cart_notifier.dart';
import 'package:eshop/features/home/ui/widgets/cart_button.dart';
import 'package:eshop/features/home/ui/widgets/image_slider.dart';
import 'package:eshop/models/product.dart';
import 'package:eshop/models/purchase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/product_detail';
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [CartButton()],
        backgroundColor: theme.colorScheme.onError,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Image Slider with Dots Indicator
          ImageSlider(screenHeight: screenHeight, product: widget.product),

          // Product Details Below the Image Slider
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  color: theme.colorScheme.onError),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title!,
                    style: theme.textTheme.titleLarge!.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(${widget.product.tags!.last})',
                            style: theme.textTheme.bodyMedium!.copyWith(
                                color: theme.colorScheme.onSecondaryFixed),
                          ),
                          SizedBox(height: 8),
                          widget.product.discountPercentage! > 0
                              ? DiscountBadge(
                                  discountPercentage:
                                      widget.product.discountPercentage!)
                              : SizedBox(),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              if (widget.product.discountPercentage! > 0) ...[
                                Text(
                                  r'$' + widget.product.price.toString(),
                                  style: theme.textTheme.titleLarge!.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    color: theme.colorScheme.onSecondaryFixed,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  r'$' +
                                      calculateDiscountedPrice(
                                              widget.product.price!,
                                              widget
                                                  .product.discountPercentage!)
                                          .toStringAsFixed(2),
                                  style: theme.textTheme.titleLarge!.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                              ] else
                                Text(
                                  r'$' + widget.product.price.toString(),
                                  style: theme.textTheme.titleLarge!.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            getAvailibility(widget.product.stock!),
                            style: theme.textTheme.titleLarge!.copyWith(
                              overflow: TextOverflow.ellipsis,
                              color: availabilityColor(
                                  getAvailibility(widget.product.stock!)),
                            ),
                          ),
                          SizedBox(height: 10),
                          quantitySelector(theme),
                          SizedBox(height: 8),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Description',
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 5),
                  Expanded(
                    child: Text(
                      widget.product.description!,
                      style: theme.textTheme.bodyMedium!.copyWith(
                          color: theme.colorScheme.onSecondaryFixed,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Total price',
                            style: theme.textTheme.bodyMedium!.copyWith(
                                color:
                                    theme.colorScheme.primary.withOpacity(.8)),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            r'$' +
                                (calculateDiscountedPrice(
                                            widget.product.price!,
                                            widget
                                                .product.discountPercentage!) *
                                        quantity)
                                    .toStringAsFixed(2),
                            style: theme.textTheme.titleLarge!
                                .copyWith(fontSize: 30),
                          )
                        ],
                      ),
                      CustomButton(
                        theme: theme,
                        onPressed: getAvailibility(widget.product.stock!) !=
                                'Out of Stock'
                            ? () {
                                final notifier = Provider.of<CartNotifier>(
                                    context,
                                    listen: false);
                                addToCart(context, notifier, widget.product,
                                    quantity);
                              }
                            : null,
                        height: 50,
                        child: Row(
                          children: [
                            Icon(
                              Icons.shopping_bag,
                              color: getAvailibility(widget.product.stock!) !=
                                      'Out of Stock'
                                  ? theme.colorScheme.onError
                                  : theme.colorScheme.onTertiaryFixed,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              'Add to Cart',
                              style: theme.textTheme.titleLarge!.copyWith(
                                color: getAvailibility(widget.product.stock!) !=
                                        'Out of Stock'
                                    ? theme.colorScheme.onError
                                    : theme.colorScheme.onTertiaryFixed,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: theme.colorScheme.secondary,
    );
  }

  Widget quantitySelector(ThemeData theme) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              setState(() {
                if (quantity > 1) quantity--;
              });
            },
          ),
          Text(
            '$quantity',
            style: theme.textTheme.titleMedium,
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                quantity++;
              });
            },
          ),
        ],
      ),
    );
  }
}

void addToCart(BuildContext context, CartNotifier notifier, Product product,
    int quantity) {
  final bool success =
      notifier.addCartItem(Purchase(product: product, quantity: quantity));
  if (context.mounted && success) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SuccessDialog(
          message: 'Your purchase has been added to cart',
          buttonText: 'OK',
          onButtonPressed: () {
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
        );
      },
    );
  }
}
