import 'package:eshop/common/app_widgets/custom_widgets/bounce.dart';
import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget trailing;
  final void Function()? onPressed;

  SettingsItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.trailing,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Bounce(
      onPressed: onPressed ?? () {},
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.titleMedium,
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
