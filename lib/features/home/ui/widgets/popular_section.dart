import 'package:eshop/common/app_widgets/custom_widgets/custom_button.dart';
import 'package:eshop/features/home/notifiers/home_notifier.dart';
import 'package:eshop/features/home/ui/screens/all_products_screen.dart';
import 'package:eshop/features/home/ui/widgets/popular_card.dart';
import 'package:eshop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final notifier = Provider.of<HomeNotifier>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular',
                style: theme.textTheme.titleLarge,
              ),
              CustomButton(
                theme: theme,
                onPressed: () =>
                    Navigator.pushNamed(context, AllProductsScreen.routeName),
                child: Text(
                  'View all',
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onError,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FutureBuilder<List<Product>>(
              future: notifier.fetchPopular(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show a loading indicator while waiting for the data
                  return PopularCard(
                    isLoading: true,
                    product: Product(),
                  );
                } else if (snapshot.hasError) {
                  // Display an error message if something goes wrong
                  return Center(
                    child: Text(
                        'Failed to load popular products: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  // Handle the case where no data is returned
                  return const Center(
                    child: Text('No products available'),
                  );
                } else {
                  final popular = snapshot.data!;
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: popular.length,
                      itemBuilder: (context, index) {
                        return PopularCard(
                          product: popular[index],
                        );
                      });
                }
              }),
        ),
      ],
    );
  }
}
