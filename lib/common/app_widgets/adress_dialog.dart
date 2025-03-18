import 'package:eshop/common/app_widgets/country_picker_field.dart';
import 'package:eshop/common/app_widgets/custom_widgets/custom_button.dart';
import 'package:eshop/common/app_widgets/details_text_field.dart';
import 'package:eshop/common/shared_notifiers/adresses_notifier.dart';
import 'package:eshop/models/adress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressDialog extends StatefulWidget {
  AddressDialog({super.key});

  @override
  State<AddressDialog> createState() => _AddressDialogState();
}

class _AddressDialogState extends State<AddressDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController streetController = TextEditingController();

  final TextEditingController houseNumberController = TextEditingController();

  final TextEditingController countryController = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  final TextEditingController postalCodeController = TextEditingController();

  final FocusNode postalCodeFocus = FocusNode();

  bool showCountryError = false;
  String countryErrorMessage = 'Please choose your country';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    ThemeData theme = Theme.of(context);

    void handleSaveAdress() {
      if (countryController.text.isEmpty) {
        setState(() {
          showCountryError = true;
        });
      } else {
        setState(() {
          showCountryError = false;
        });
      }
      if (_formKey.currentState!.validate() && !showCountryError) {
        final adressNotifier =
            Provider.of<AdressesNotifier>(context, listen: false);
        final newAddress = Adress(
          title: titleController.text,
          street: streetController.text,
          houseNumber: houseNumberController.text,
          country: countryController.text,
          city: cityController.text,
          postalCode: postalCodeController.text,
        );
        adressNotifier.addAdress(newAddress, Theme.of(context));
        Navigator.of(context).pop();
      }
    }

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 5),
      // Removes default padding
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Container(
          width: screenWidth, // Sets the width to the full screen width
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Add New Address',
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 16),
                  DetailsTextField(
                    controller: titleController,
                    autofocus: true,
                    hintText: 'give this adress a name',
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  DetailsTextField(
                    controller: streetController,
                    hintText: 'street',
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a street';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  DetailsTextField(
                    controller: houseNumberController,
                    hintText: 'house number',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a house number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  DetailsTextField(
                    controller: cityController,
                    hintText: 'city',
                    focus: postalCodeFocus,
                    textInputAction: TextInputAction.none,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a city';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  CountryPickerField(
                    countryController: countryController,
                  ),
                  showCountryError
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, left: 13.0),
                            child: Text(
                              countryErrorMessage,
                              style: theme.textTheme.bodySmall!
                                  .copyWith(color: theme.colorScheme.error),
                            ),
                          ),
                        )
                      : SizedBox(),
                  SizedBox(height: 8),
                  DetailsTextField(
                    controller: postalCodeController,
                    hintText: 'postal Code',
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a postal code';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: theme.textTheme.bodyMedium!.copyWith(
                              color: theme.colorScheme.onSecondaryFixed),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CustomButton(
                        theme: theme,
                        onPressed: handleSaveAdress,
                        child: Text('Save'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
