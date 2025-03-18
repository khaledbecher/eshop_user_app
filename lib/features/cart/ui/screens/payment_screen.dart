import 'package:eshop/common/app_widgets/addAdressButton.dart';
import 'package:eshop/common/app_widgets/adress_dialog.dart';
import 'package:eshop/common/app_widgets/custom_widgets/custom_button.dart';
import 'package:eshop/common/constants/app_constants.dart';
import 'package:eshop/common/shared_notifiers/adresses_notifier.dart';
import 'package:eshop/common/shared_notifiers/orders_notifier.dart';
import 'package:eshop/common/utils/interaction_utils/toasts/toast_utils.dart';
import 'package:eshop/features/cart/functions/cart_functions.dart';
import 'package:eshop/features/cart/notifiers/cart_notifier.dart';
import 'package:eshop/features/cart/ui/widgets/adress_item.dart';
import 'package:eshop/features/cart/ui/widgets/price_box.dart';
import 'package:eshop/models/adress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatelessWidget {
  final double subTotal;
  final double shipping;
  final double bagTotal;
  final int quantity;

  const PaymentScreen(
      {super.key,
      required this.subTotal,
      required this.shipping,
      required this.bagTotal,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Future<void> handleConfirm() async {
      if (context.read<AdressesNotifier>().adresses.isEmpty) {
        showInfoToast(msg: 'You need to add a shipping adress !');
      } else {
        final cartNotifier = Provider.of<CartNotifier>(context, listen: false);
        context.read<OrdersNotifier>().changeCategoryIndex(
            AppConstants.orderCategories.indexOf('Pending'));
        if (AppConstants.paymentMethods[cartNotifier.paymentMethodIndex] ==
            'Pay with card') {
          await cartNotifier.makePayment(theme, context);
        } else {
          addOrder(context);
        }
      }
    }

    return Scaffold(
      backgroundColor: theme.colorScheme.onError,
      appBar: AppBar(
        title: Text(
          'Payment',
          style: theme.textTheme.headlineLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Choose your shipping adress',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Selector<AdressesNotifier,
                          ({int adressIndex, List<Adress> adresses})>(
                      selector: (_, notifier) => (
                            adressIndex: notifier.adressIndex,
                            adresses: notifier.adresses
                          ),
                      builder: (_, data, __) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            children: List.generate(data.adresses.length + 1,
                                (index) {
                              return index != data.adresses.length
                                  ? AdressItem(
                                      onPressed: () {
                                        final adressNotifier =
                                            Provider.of<AdressesNotifier>(
                                                context,
                                                listen: false);
                                        adressNotifier.changeAdressIndex(index);
                                      },
                                      isSelected: index == data.adressIndex,
                                      adress: data.adresses[index])
                                  : Center(
                                      child: Addadressbutton(
                                        onPressed: () => showDialog(
                                          context: context,
                                          builder: (context) => AddressDialog(),
                                        ),
                                      ),
                                    );
                            }),
                          ),
                        );
                      }),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Payment method',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Selector<CartNotifier, int>(
                      selector: (_, notifier) => notifier.paymentMethodIndex,
                      builder: (_, paymentMethodIndex, __) {
                        List paymentMethods = AppConstants.paymentMethods;
                        return Column(
                          children: [
                            for (int i = 0; i < paymentMethods.length; i++)
                              RadioListTile<int>(
                                title: Text(paymentMethods[i]),
                                value: i, // Use index as value
                                groupValue: paymentMethodIndex,
                                onChanged: (int? value) {
                                  if (value != null) {
                                    final cartNotifier =
                                        Provider.of<CartNotifier>(context,
                                            listen: false);
                                    cartNotifier
                                        .changePaymentMethodIndex(value);
                                  }
                                },
                              ),
                          ],
                        );
                      })
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PriceBox(
                  subTotal: subTotal,
                  shipping: shipping,
                  bagTotal: bagTotal,
                  quantity: quantity,
                ),
                SizedBox(
                  height: 12.0,
                ),
                Selector<OrdersNotifier, bool>(
                    selector: (BuildContext ctx, notifier) =>
                        notifier.isLoading,
                    builder: (_, isLoading, __) {
                      return AnimatedSize(
                        duration: Duration(milliseconds: 300),
                        child: isLoading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : SizedBox(),
                      );
                    }),
                SizedBox(
                  height: 12.0,
                ),
                CustomButton(
                  theme: theme,
                  verticalPadding: 12,
                  width: 200,
                  onPressed: handleConfirm,
                  child: Text(
                    'Confirm',
                    style: theme.textTheme.titleLarge!
                        .copyWith(color: theme.colorScheme.onError),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
