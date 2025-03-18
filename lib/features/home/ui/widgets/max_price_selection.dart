import 'package:eshop/common/app_widgets/custom_widgets/custom_button.dart';
import 'package:eshop/features/home/notifiers/home_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MaxPriceSelection extends StatelessWidget {
  const MaxPriceSelection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final notifier = Provider.of<HomeNotifier>(context, listen: false);
    return Selector<HomeNotifier, bool>(
        selector: (_, notifier) => notifier.visibleFilter,
        builder: (_, visibleFilter, __) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: visibleFilter
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.end,
              children: [
                visibleFilter ? Text('\$0') : SizedBox(),
                visibleFilter
                    ? Expanded(
                        child: Selector<HomeNotifier, double>(
                            selector: (_, notifier) => notifier.maximalPrice,
                            builder: (_, maximalPrice, __) {
                              return SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  showValueIndicator: ShowValueIndicator
                                      .always, // Always show label
                                ),
                                child: Slider(
                                  inactiveColor:
                                      theme.colorScheme.onSecondaryFixed,
                                  value: maximalPrice,
                                  // Bind the value to the notifier
                                  min: 1,
                                  max: 20000,
                                  // Adjust the range as needed
                                  divisions: 15000,
                                  label: '\$${maximalPrice.toStringAsFixed(0)}',
                                  onChanged: (value) {
                                    notifier.setMaxPrice(
                                        value); // Update the value in the notifier
                                  },
                                ),
                              );
                            }),
                      )
                    : SizedBox(),
                visibleFilter ? Text('\$20K') : SizedBox(),
                visibleFilter
                    ? IconButton(
                        onPressed: () {
                          notifier.toggleVisibleFilter();
                          notifier.clearFilter();
                        },
                        icon: Icon(Icons.clear),
                      )
                    : CustomButton(
                        theme: theme,
                        onPressed: () {
                          notifier.toggleVisibleFilter();
                          notifier.clearFilter();
                          notifier.setVisibleGenderSelection(false);
                          notifier.setVisibleSubcategories(false);
                        },
                        child: Row(
                          children: [
                            Text(
                              'Filter',
                              style: theme.textTheme.titleSmall!.copyWith(
                                color: theme.colorScheme.onError,
                              ),
                            ),
                            Icon(
                              Icons.filter_alt_rounded,
                              color: theme.colorScheme.onError,
                              size: 15,
                            ),
                          ],
                        ),
                      ), // Maximum price label
              ],
            ),
          );
        });
  }
}
