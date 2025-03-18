import 'package:eshop/common/app_widgets/category_button.dart';
import 'package:eshop/common/constants/app_constants.dart';
import 'package:eshop/common/shared_notifiers/orders_notifier.dart';
import 'package:eshop/features/settings/ui/widgets/order_item.dart';
import 'package:eshop/models/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final ordersNotifier = context.read<OrdersNotifier>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders',
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
          Divider(
            color: theme.colorScheme.primary,
          ),
          Text(
            'Orders filter',
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Selector<OrdersNotifier, int>(
                selector: (_, notifier) => notifier.categoryIndex,
                builder: (_, categoryIndex, __) {
                  return Row(
                    children: List.generate(AppConstants.orderCategories.length,
                        (index) {
                      return CategoryButton(
                        text: AppConstants.orderCategories[index],
                        isSelected: categoryIndex == index,
                        onPressed: () => context
                            .read<OrdersNotifier>()
                            .changeCategoryIndex(index),
                      );
                    }),
                  );
                }),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: theme.colorScheme.primary,
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ordersNotifier.refresh();
              },
              child: Selector<OrdersNotifier,
                      ({int categoryIndex, bool refresher})>(
                  selector: (_, notifier) => (
                        categoryIndex: notifier.categoryIndex,
                        refresher: notifier.refresher
                      ),
                  builder: (_, data, __) {
                    return FutureBuilder<List<Orderr>>(
                        future:
                            AppConstants.orderCategories[data.categoryIndex] ==
                                    'All orders'
                                ? ordersNotifier.fetchAllOrders()
                                : ordersNotifier.fetchOrdersWithStatusFilter(
                                    status: AppConstants
                                        .orderCategories[data.categoryIndex]),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Show a loading indicator while waiting for the data
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            // Display an error message if something goes wrong
                            return Center(
                              child: Text(
                                  'Failed to load orders: ${snapshot.error}'),
                            );
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            // Handle the case where no data is returned
                            return const Center(
                              child: Text('No data available'),
                            );
                          } else {
                            final orders = snapshot.data!;
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: ListView.builder(
                                itemCount: orders.length,
                                itemBuilder: (context, index) {
                                  return OrderItem(
                                    order: orders[index],
                                  );
                                },
                              ),
                            );
                          }
                        });
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
