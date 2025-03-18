import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CountryPickerField extends StatelessWidget {
  final TextEditingController countryController;

  const CountryPickerField({super.key, required this.countryController});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double screenHeight = MediaQuery.of(context).size.height;

    return
        GestureDetector(
          onTap: () {
            showCountryPicker(
              context: context,
              useSafeArea: true,
              showPhoneCode: false,
              countryListTheme: CountryListThemeData(
                backgroundColor: theme.colorScheme.onError,
                bottomSheetHeight: screenHeight* .75,
                inputDecoration: InputDecoration(
                  hintText: 'Start typing to search',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  hintStyle: theme.textTheme.titleMedium!.copyWith(color: theme.colorScheme.onSecondaryFixed),
                  fillColor: theme.colorScheme.tertiary,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                ),
              ),

              onSelect: (Country country) {
                countryController.text = country.name;
              },
            );
          },
          child: Container(
            padding:  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: theme.colorScheme.tertiary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  countryController.text.isEmpty
                      ? 'Select your country'
                      : countryController.text,
                  style:countryController.text.isEmpty
                      ? theme.textTheme.titleMedium!.copyWith(color: theme.colorScheme.onSecondaryFixed)
                  :theme.textTheme.bodyMedium ,
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        );
  }
}
