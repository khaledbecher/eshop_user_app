import 'package:eshop/common/app_widgets/category_button.dart';
import 'package:eshop/common/constants/app_constants.dart';
import 'package:eshop/features/home/notifiers/home_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Selector<HomeNotifier, int>(
              selector: (_, notifier) => notifier.categoryIndex,
              builder: (_, categoryIndex, __) {
                return Row(
                  children:
                      List.generate(AppConstants.categories.length, (index) {
                    return CategoryButton(
                      text: AppConstants.categories[index],
                      isSelected: categoryIndex == index,
                      onPressed: () {
                        final notifier =
                            Provider.of<HomeNotifier>(context, listen: false);
                        if (categoryIndex == index) {
                          notifier.setVisibleSubcategories(false);
                          notifier.setVisibleGenderSelection(false);
                          notifier.resetIndexes();
                        } else if (AppConstants.categories[index] ==
                            'Fashion') {
                          notifier.changeCategoryIndex(index);
                          notifier.changeSubCategoryIndex(-1);
                          notifier.changeGenderIndex(-1);
                          notifier.setVisibleGenderSelection(true);
                          notifier.setVisibleSubcategories(false);
                        } else {
                          notifier.changeCategoryIndex(index);
                          notifier.changeSubCategoryIndex(-1);
                          notifier.changeGenderIndex(-1);
                          notifier.setVisibleSubcategories(true);
                          notifier.setVisibleGenderSelection(false);
                        }
                      },
                    );
                  }),
                );
              }),
        ),
      ],
    );
  }
}
