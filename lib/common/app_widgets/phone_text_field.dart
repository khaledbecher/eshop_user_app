import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool isProfile;
   const PhoneTextField({super.key, this.controller, required this.isProfile});

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  PhoneNumber number = PhoneNumber(isoCode: 'DE');
  final visibleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InternationalPhoneNumberInput(
      inputDecoration: InputDecoration(
        labelText: widget.isProfile ? null : 'Phone number',
        hintText: 'Enter phone number',
        hintStyle: theme.textTheme.titleMedium!
            .copyWith(color: theme.colorScheme.onSecondaryFixed),
        filled: widget.isProfile,
        fillColor: widget.isProfile ? theme.colorScheme.tertiary : null,
        focusedBorder: !widget.isProfile
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    BorderSide(color: theme.colorScheme.primary, width: 2.0))
            : null,
        focusColor: !widget.isProfile ? theme.colorScheme.primary : null,
        border: widget.isProfile
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
        contentPadding: widget.isProfile
            ? const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0)
            : null,
        labelStyle: theme.textTheme.titleSmall,
      ),
      selectorConfig: SelectorConfig(
        leadingPadding: 8,
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        useEmoji: true,
        trailingSpace: true,
        setSelectorButtonAsPrefixIcon: true,
        useBottomSheetSafeArea: true,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: TextStyle(color: theme.colorScheme.primary),
      initialValue: number,
      textFieldController: visibleController,
      formatInput: true,
      keyboardType:
          TextInputType.numberWithOptions(signed: true, decimal: true),
      inputBorder: InputBorder.none,
      onSaved: (PhoneNumber number) {
        print('On Saved: $number');
      },
      onInputChanged: (PhoneNumber value) {
        setState(() {
          widget.controller!.text =
              value.phoneNumber ?? ''; // Update controller text
        });
        print(widget.controller!.text);
        print(visibleController.text);
      },
    );
  }
}
