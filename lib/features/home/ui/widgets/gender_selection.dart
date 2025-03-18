import 'package:eshop/common/app_widgets/gender_button.dart';
import 'package:eshop/common/constants/app_constants.dart';
import 'package:eshop/features/home/notifiers/home_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderSelection extends StatelessWidget {
  const GenderSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomeNotifier, int>(
        selector: (_, notifier) => notifier.genderIndex,
        builder: (_, genderIndex, __) {
          return SizedBox(
            width: double.maxFinite,
            child: Row(
              children: List.generate(
                AppConstants.genders.length,
                (index) => Expanded(
                  child: Genderbutton(
                    text: AppConstants.genders[index],
                    enabled: genderIndex == index,
                    onTap: () {
                      final notifier = Provider.of<HomeNotifier>(context, listen: false);
                      if (genderIndex == index) {
                        notifier.changeGenderIndex(-1);
                        notifier.changeSubCategoryIndex(-1);
                        notifier.setVisibleSubcategories(false);
                      } else {
                        notifier.changeGenderIndex(index);
                        notifier.changeSubCategoryIndex(-1);
                        notifier.setVisibleSubcategories(true);
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        });
  }
}
