import 'package:flutter/material.dart';

class Addadressbutton extends StatelessWidget {
  final void Function()? onPressed;

  Addadressbutton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return TextButton(
      onPressed: onPressed ?? () {},
      child: Text(
        '+ add new adress',
        style: theme.textTheme.titleSmall!
            .copyWith(color: theme.colorScheme.onSecondaryFixed),
      ),
    );
  }
}
