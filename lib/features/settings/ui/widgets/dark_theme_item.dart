import 'package:eshop/common/shared_notifiers/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DarkThemeItem extends StatelessWidget {
  const DarkThemeItem({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.dark_mode,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            'Dark mode',
            style: theme.textTheme.titleMedium,
          ),
        ),
        Switch(
            value: context.watch<ThemeNotifier>().darkTheme,
            onChanged: (_) => context.read<ThemeNotifier>().toggleDarkTheme()),
      ],
    );
  }
}
