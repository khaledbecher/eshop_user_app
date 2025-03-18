import 'package:eshop/common/app_widgets/category_button.dart';
import 'package:eshop/common/constants/app_constants.dart';
import 'package:eshop/features/home/notifiers/home_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


class Subcategoriessection extends StatelessWidget {
  const Subcategoriessection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Selector<HomeNotifier,
              ({int subCategoryIndex, int categoryIndex, int genderIndex})>(
          selector: (_, notifier) => (
                subCategoryIndex: notifier.subCategoryIndex,
                categoryIndex: notifier.categoryIndex,
                genderIndex: notifier.genderIndex
              ),
          builder: (_, data, __) {
            final notifier = Provider.of<HomeNotifier>(context, listen: false);
            if(data.categoryIndex!= -1){
            return Row(
              children: List.generate(
                  (AppConstants.categories[data.categoryIndex] == 'Fashion' &&
                          data.genderIndex != -1)
                      ? AppConstants
                          .subCategories[data.categoryIndex][data.genderIndex]
                          .length
                      : (AppConstants.categories[data.categoryIndex] == 'Fashion' &&
                              data.genderIndex == -1)
                          ? 0
                          : AppConstants.subCategories[data.categoryIndex].length,
                  (index) {
                if (AppConstants.categories[data.categoryIndex] == 'Fashion' &&
                    data.genderIndex != -1) {
                  return CategoryButton(
                    text: AppConstants.subCategories[data.categoryIndex]
                            [data.genderIndex][index],
                    isSelected: data.subCategoryIndex == index,
                    onPressed: () => notifier.changeSubCategoryIndex(
                        data.subCategoryIndex == index ? -1 : index),
                  );
                }else if (AppConstants.categories[data.categoryIndex] == 'Fashion' &&
                    data.genderIndex == -1){return SizedBox();

                }else{  return CategoryButton(
                  text: AppConstants.subCategories[data.categoryIndex][index],
                  isSelected: data.subCategoryIndex == index,
                  onPressed: () => notifier.changeSubCategoryIndex(
                      data.subCategoryIndex == index ? -1 : index),
                );

                }
              }),
            );}else{
              return SizedBox();
            }
          }),
    );
  }
}
