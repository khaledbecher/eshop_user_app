import 'package:eshop/features/home/notifiers/home_notifier.dart';
import 'package:eshop/features/home/ui/widgets/categories_section.dart';
import 'package:eshop/features/home/ui/widgets/gender_selection.dart';
import 'package:eshop/features/home/ui/widgets/max_price_selection.dart';
import 'package:eshop/features/home/ui/widgets/sub_categories_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<
        HomeNotifier,
        ({
          bool visibleFilter,
          bool visibleSubCategories,
          bool visibleGenderSelection
        })>(
      selector: (_, notifier) => (
        visibleFilter: notifier.visibleFilter,
        visibleSubCategories: notifier.visibleSubCategories,
        visibleGenderSelection: notifier.visibleGenderSelection
      ),
      builder: (_, data, __) {
        return Column(
          children: [
            MaxPriceSelection(), // New maximal price selection widget

            AnimatedContainer(
              height: data.visibleFilter ? 60 : 0,
              // Adjust height to fit new content
              duration: Duration(milliseconds: 300),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    CategoriesSection(),
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              height: data.visibleGenderSelection ? 80 : 0,
              // Adjust height to fit new content
              duration: Duration(milliseconds: 500),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    GenderSelection(),
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              height: data.visibleSubCategories ? 80 : 0,
              // Adjust height to fit new content
              duration: Duration(milliseconds: 500),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Subcategoriessection(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
