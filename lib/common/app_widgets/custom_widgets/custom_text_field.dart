import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final FocusNode? focus;
  final TextEditingController? controller;
  final String? hintText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final int? maxLength;

  const CustomTextField(
      {super.key,
      this.label,
      this.focus,
      this.suffixIcon,
      this.onChanged,
      this.textInputAction,
      this.controller,
      this.obscureText = false,
      this.validator,
      this.onEditingComplete,
      this.hintText,
      this.keyboardType,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      onChanged: onChanged,
      focusNode: focus,
      obscureText: obscureText!,
      maxLength: maxLength,
      onEditingComplete: onEditingComplete,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        counterText: '',
        hintText: hintText,
        hintStyle: theme.textTheme.titleMedium!
            .copyWith(color: theme.colorScheme.onSecondaryFixed),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide:
                BorderSide(color: theme.colorScheme.primary, width: 2.0)),
        focusColor: theme.colorScheme.primary,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelStyle: theme.textTheme.titleSmall,
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }
}
