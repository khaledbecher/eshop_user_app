import 'package:eshop/common/app_widgets/buttom_nav_bar.dart';
import 'package:eshop/common/app_widgets/custom_search_bar.dart';
import 'package:eshop/common/app_widgets/custom_widgets/collapsible_header_delegate.dart';
import 'package:eshop/common/app_widgets/product_box.dart';
import 'package:eshop/features/home/notifiers/home_notifier.dart';
import 'package:eshop/features/home/ui/widgets/filter_section.dart';
import 'package:eshop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreenWithFilter extends StatefulWidget {
  static const routeName = '/search_with_filter';

  const SearchScreenWithFilter({super.key});

  @override
  State<SearchScreenWithFilter> createState() => _SearchScreenWithFilterState();
}

class _SearchScreenWithFilterState extends State<SearchScreenWithFilter> {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocus = FocusNode();
  String keyWord = '';
  bool clearVisible = false;

  void onClearTapped() {
    setState(() {
      searchController.clear();
      clearVisible = !clearVisible;
      keyWord = '';
    });
  }

  void onChanged(String newKeyWord) {
    if (newKeyWord.isNotEmpty && !clearVisible) {
      setState(() {
        clearVisible = !clearVisible;
      });
    }
    if (newKeyWord.isEmpty && clearVisible) {
      setState(() {
        clearVisible = !clearVisible;
      });
    }
    setState(() {
      keyWord = newKeyWord;
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<HomeNotifier>(context, listen: false);
    final ThemeData theme = Theme.of(context);
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        notifier.clearFilter();
        notifier.setVisibleFilter(false);
      },
      child: GestureDetector(
        onTap: searchFocus.unfocus,
        child: Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  collapsedHeight: 80,
                  expandedHeight: 80,
                  pinned: true,
                  flexibleSpace: Container(
                    color: theme.colorScheme.surface,
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 20, bottom: 10),
                    child: CustomSearchBar(
                      searchFocus: searchFocus,
                      clearVisible: clearVisible,
                      onClearTapped: onClearTapped,
                      onChanged: onChanged,
                      searchController: searchController,
                      hintText: 'What are you looking for?',
                    ),
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
                          visibleGenderSelection:
                              notifier.visibleGenderSelection,
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
                              : (data.visibleFilter &&
                                      data.visibleGenderSelection)
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
                keyWord.isNotEmpty
                    ? // SliverGrid
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
                              future:
                                  notifier.searchProductsWithFilter(keyWord),
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
                                        return ProductBox(
                                          product: products[index],
                                        );
                                      },
                                      childCount: products.length,
                                    ),
                                  );
                                }
                              });
                        })
                    : SliverFillRemaining(child: SizedBox()),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavBar(),
        ),
      ),
    );
  }
}
