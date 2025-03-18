import 'package:eshop/features/home/notifiers/home_notifier.dart';
import 'package:eshop/features/home/ui/widgets/discount_card.dart';
import 'package:eshop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscountsSection extends StatelessWidget {
  const DiscountsSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final notifier =
        Provider.of<HomeNotifier>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Top sales',
            style: theme.textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: 300,
          child: FutureBuilder<List<Product>>(
              future: notifier.fetchTopDiscounts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show a loading indicator while waiting for the data
                  return ListView(scrollDirection: Axis.horizontal,
                    children: List.generate(2, (index)=>DiscountCard(isLoading: true,product: Product(),)),
                  );
                } else if (snapshot.hasError) {
                  // Display an error message if something goes wrong
                  return Center(
                    child: Text(
                        'Failed to load discounts: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  // Handle the case where no data is returned
                  return const Center(
                    child: Text('No discounts available'),
                  );
                } else {
                  final discounts = snapshot.data!;
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: discounts.length,
                      itemBuilder: (context, index) {
                        return DiscountCard(product: discounts[index],

                        );
                      });
                }
              }),
        ),
      ],
    );
  }
}
