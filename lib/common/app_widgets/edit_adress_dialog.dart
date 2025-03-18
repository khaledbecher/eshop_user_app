import 'package:eshop/common/app_widgets/country_picker_field.dart';
import 'package:eshop/common/app_widgets/custom_widgets/custom_button.dart';
import 'package:eshop/common/app_widgets/details_text_field.dart';
import 'package:eshop/common/shared_notifiers/adresses_notifier.dart';
import 'package:eshop/models/adress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditAdressDialog extends StatefulWidget {
  final Adress adress;

  const EditAdressDialog({super.key, required this.adress});

  @override
  State<EditAdressDialog> createState() => _EditAdressDialogState();
}

class _EditAdressDialogState extends State<EditAdressDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController streetController = TextEditingController();

  final TextEditingController houseNumberController = TextEditingController();

  final TextEditingController countryController = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  final TextEditingController postalCodeController = TextEditingController();

  final FocusNode titleFocus = FocusNode();
  final FocusNode streetFocus = FocusNode();
  final FocusNode houseNumberFocus = FocusNode();
  final FocusNode countryFocus = FocusNode();
  final FocusNode cityFocus = FocusNode();
  final FocusNode postalCodeFocus = FocusNode();

  @override
  void initState() {
    titleController.text = widget.adress.title ?? '';
    streetController.text = widget.adress.street ?? '';
    houseNumberController.text = widget.adress.houseNumber ?? '';
    countryController.text = widget.adress.country ?? '';
    cityController.text = widget.adress.city ?? '';
    postalCodeController.text = widget.adress.postalCode ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    ThemeData theme = Theme.of(context);

    void handleEditAdress() async {
      if (_formKey.currentState!.validate()) {
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
        adressNotifier.editAdress(widget.adress, newAddress, theme);
        Navigator.of(context).pop();
      }
    }

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Container(
          width: screenWidth,
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Edit your Address',
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 16),
                  DetailsTextField(
                    focus: titleFocus,
                    controller: titleController,
                    hintText: 'give this adress a name',
                    textInputAction: TextInputAction.next,
                    suffixIcon: IconButton(
                        onPressed: () {
                          titleController.clear();
                          titleFocus.requestFocus();
                        },
                        icon: Icon(
                          Icons.clear,
                          color: theme.colorScheme.primary.withOpacity(.6),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  DetailsTextField(
                    focus: streetFocus,
                    controller: streetController,
                    hintText: 'street',
                    textInputAction: TextInputAction.next,
                    suffixIcon: IconButton(
                        onPressed: () {
                          streetController.clear();
                          streetFocus.requestFocus();
                        },
                        icon: Icon(
                          Icons.clear,
                          color: theme.colorScheme.primary.withOpacity(.6),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a street';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  DetailsTextField(
                    focus: houseNumberFocus,
                    controller: houseNumberController,
                    suffixIcon: IconButton(
                        onPressed: () {
                          houseNumberController.clear();
                          houseNumberFocus.requestFocus();
                        },
                        icon: Icon(
                          Icons.clear,
                          color: theme.colorScheme.primary.withOpacity(.6),
                        )),
                    hintText: 'house number',
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a house number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  DetailsTextField(
                    focus: cityFocus,
                    controller: cityController,
                    suffixIcon: IconButton(
                      onPressed: () {
                        cityController.clear();
                        cityFocus.requestFocus();
                      },
                      icon: Icon(
                        Icons.clear,
                        color: theme.colorScheme.primary.withOpacity(.6),
                      ),
                    ),
                    hintText: 'city',
                    textInputAction: TextInputAction.next,
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
                  SizedBox(height: 8),
                  DetailsTextField(
                    focus: postalCodeFocus,
                    controller: postalCodeController,
                    hintText: 'postal Code',
                    suffixIcon: IconButton(
                      onPressed: () {
                        postalCodeController.clear();
                        postalCodeFocus.requestFocus();
                      },
                      icon: Icon(
                        Icons.clear,
                        color: theme.colorScheme.primary.withOpacity(.6),
                      ),
                    ),
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
                        onPressed: handleEditAdress,
                        child: Text('Edit'),
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
