import 'package:eshop/common/app_widgets/buttom_nav_bar.dart';
import 'package:eshop/common/app_widgets/custom_widgets/custom_button.dart';
import 'package:eshop/common/constants/app_constants.dart';
import 'package:eshop/common/shared_notifiers/navigation_notifier.dart';
import 'package:eshop/features/cart/notifiers/cart_notifier.dart';
import 'package:eshop/features/cart/ui/screens/payment_screen.dart';
import 'package:eshop/features/cart/ui/widgets/cart_item_card.dart';
import 'package:eshop/features/cart/ui/widgets/price_box.dart';
import 'package:eshop/models/purchase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart_screen';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) context.read<NavigationNotifier>().returnBack();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Provider.of<NavigationNotifier>(context, listen: false)
                  .returnBack();
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_outlined),
          ),
          title: Text(
            'My Cart',
            style: theme.textTheme.headlineLarge,
          ),
          centerTitle: true,
        ),
        body: Selector<
                CartNotifier,
                ({
                  List<Purchase> cartItems,
                  List<int> quantities,
                  double subTotalPrice,
                  double totalPrice,
                })>(
            selector: (_, notifier) => (
                  cartItems: notifier.cartItems,
                  quantities: notifier.quantities,
                  subTotalPrice: notifier.subTotalPrice,
                  totalPrice: notifier.totalPrice,
                ),
            builder: (_, data, __) {
              return data.cartItems.isNotEmpty
                  ? Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: data.cartItems.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CartItemCard(
                                  index: index,
                                  quantity: data.quantities[index],
                                  product: data.cartItems[index].product!);
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, bottom: 10.0, top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          child: Column(
                            children: [
                              PriceBox(
                                subTotal: data.subTotalPrice,
                                shipping: AppConstants.shippingPrice,
                                bagTotal: data.totalPrice,
                                quantity: data.cartItems.length,
                              ),
                              SizedBox(height: 10),
                              CustomButton(
                                theme: theme,
                                height: 50,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => PaymentScreen(
                                        subTotal: data.subTotalPrice,
                                        shipping: AppConstants.shippingPrice,
                                        bagTotal: data.totalPrice,
                                        quantity: data.cartItems.length,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Proceed to Checkout',
                                  style: theme.textTheme.titleMedium!.copyWith(
                                      color: theme.colorScheme.onError),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Text(
                      'Your cart is empty !',
                      style: theme.textTheme.titleLarge,
                    ));
            }),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
