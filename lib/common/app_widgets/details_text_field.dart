import 'package:flutter/material.dart';

class DetailsTextField extends StatelessWidget {
  final String? label;
  final FocusNode? focus;
  final TextEditingController? controller;
  final String? hintText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final bool? autofocus;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final int? maxLength;

  const DetailsTextField(
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
      this.autofocus,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return TextFormField(
      focusNode: focus,
      controller: controller,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      obscureText: obscureText!,
      maxLength: maxLength,
      autofocus: autofocus ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        counterText: '',
        labelText: label,
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: theme.textTheme.titleMedium!
            .copyWith(color: theme.colorScheme.onSecondaryFixed),
        filled: true,
        fillColor: theme.colorScheme.tertiary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      ),
      validator: validator,
    );
  }
}
