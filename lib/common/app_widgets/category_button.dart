import 'package:eshop/common/app_widgets/custom_widgets/bounce.dart';
import 'package:flutter/material.dart';


class CategoryButton extends StatelessWidget {
  final bool? isSelected;
  final String? text;
  final void Function()? onPressed;

  const CategoryButton({
    super.key,
    this.isSelected = false,
    this.text = '',
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Bounce(
      onPressed: onPressed ?? () {},
      child: Container(
        margin: const EdgeInsets.only(left: 16.0),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected! ? theme.colorScheme.primary : theme.colorScheme.onError,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected! ?theme.colorScheme.primary : theme.colorScheme.onSecondaryFixed.withOpacity(.7),
          ),
        ),
        child: Text(
          text!,
          style: theme.textTheme.titleSmall!.copyWith(
            color: isSelected! ?  theme.colorScheme.onError : theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
