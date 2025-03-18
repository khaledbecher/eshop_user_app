import 'package:eshop/common/app_widgets/buttom_nav_bar.dart';
import 'package:eshop/common/app_widgets/custom_widgets/collapsible_header_delegate.dart';
import 'package:eshop/common/app_widgets/product_box.dart';
import 'package:eshop/features/favorites/notifiers/favorites_notifier.dart';
import 'package:eshop/features/home/notifiers/home_notifier.dart';
import 'package:eshop/features/home/ui/screens/search_screen_with_filter.dart';
import 'package:eshop/features/home/ui/widgets/filter_section.dart';
import 'package:eshop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProductsScreen extends StatelessWidget {
  static const routeName = '/all_products';

  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final notifier = Provider.of<HomeNotifier>(context, listen: false);
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        notifier.clearFilter();
        notifier.setVisibleFilter(false);
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // SliverAppBar (Header)
            SliverAppBar(
              leading: IconButton(
                onPressed: () {
                  notifier.clearFilter();
                  notifier.setVisibleFilter(false);
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_outlined),
              ),
              actions: [
                IconButton(
                    onPressed: () => Navigator.pushNamed(
                        context, SearchScreenWithFilter.routeName),
                    icon: Icon(Icons.search))
              ],
              backgroundColor: theme.colorScheme.secondary,
              expandedHeight: 50,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'All Products',
                  style: theme.textTheme.headlineLarge,
                ),
                centerTitle: true,
              ),
            ),

            // SliverPersistentHeader to wrap the SliverList
            Selector<
                    HomeNotifier,
                    ({
                      bool visibleFilter,
                      bool visibleGenderSelection,
                      bool visibleSubCategories
                    })>(
                selector: (_, notifier) => (
                      visibleFilter: notifier.visibleFilter,
                      visibleGenderSelection: notifier.visibleGenderSelection,
                      visibleSubCategories: notifier.visibleSubCategories
                    ),
                builder: (_, data, __) {
                  return SliverPersistentHeader(
                    pinned: false, // It won't stick to the top
                    floating: false, // It won't reappear while scrolling
                    delegate: CollapsibleHeaderDelegate(
                      minHeight: 0,
                      // Fully collapses
                      maxHeight: data.visibleFilter &&
                              data.visibleGenderSelection &&
                              data.visibleSubCategories
                          ? 250
                          : (data.visibleFilter && data.visibleGenderSelection)
                              ? 180
                              : (data.visibleFilter &&
                                      data.visibleSubCategories)
                                  ? 180
                                  : (data.visibleFilter)
                                      ? 110
                                      : 60,
                      // Initial expanded height
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            FilterSection(),
                          ],
                        ),
                      ), // Build the SliverList
                    ),
                  );
                }),

            // SliverGrid
            Selector<
                    HomeNotifier,
                    ({
                      double maximalPrice,
                      int categoryIndex,
                      int subCateroryIndex,
                      int genderIndex
                    })>(
                selector: (_, notifier) => (
                      maximalPrice: notifier.maximalPrice,
                      categoryIndex: notifier.categoryIndex,
                      subCateroryIndex: notifier.subCategoryIndex,
                      genderIndex: notifier.genderIndex
                    ),
                builder: (_, data, __) {
                  return FutureBuilder<List<Product>>(
                      future: notifier.fetchProductsWithFilter(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // Show a loading indicator while waiting for the data
                          return SliverFillRemaining(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          // Display an error message if something goes wrong
                          return SliverFillRemaining(
                            child: Center(
                              child: Text(
                                  'Failed to load products: ${snapshot.error}'),
                            ),
                          );
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          // Handle the case where no data is returned
                          return SliverFillRemaining(
                            child: const Center(
                              child: Text('No data available'),
                            ),
                          );
                        } else {
                          final products = snapshot.data!;
                          return SliverGrid(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              // Number of columns
                              mainAxisSpacing: 0,
                              // Vertical spacing between items
                              crossAxisSpacing: 0,
                              // Horizontal spacing between items
                              childAspectRatio: 0.7,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return Selector<FavoritesNotifier, List>(
                                    selector: (_, notifier) =>
                                        notifier.favorites,
                                    builder: (_, favorites, __) {
                                      return ProductBox(
                                        product: products[index],
                                      );
                                    });
                              },
                              childCount: products.length,
                            ),
                          );
                        }
                      });
                }),
          ],
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
