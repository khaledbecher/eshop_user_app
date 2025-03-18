import 'package:eshop/features/authentification/notifiers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildLoginHeader(ThemeData theme) {
  return Column(
    children: [
      Text(
        'E-shop',
        style: theme.textTheme.headlineLarge!
            .copyWith(fontFamily: 'cursive', fontSize: 48),
      ),
      Text('My Life My Style',
          style: theme.textTheme.titleMedium!
              .copyWith(fontStyle: FontStyle.italic)),
      SizedBox(height: 40),
      Text(
        'Welcome!',
        style: theme.textTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 10),
      Text(
        'please login or sign up to continue',
        style: theme.textTheme.titleSmall!
            .copyWith(color: theme.colorScheme.onSecondaryFixed),
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget buildProgressIndicator(ThemeData theme, BuildContext ctx) {
  return Selector<AuthNotifier, bool>(
      selector: (BuildContext ctx, notifier) => notifier.isLoading,
      builder: (_, isLoading, __) {
        return AnimatedSize(
          duration: Duration(milliseconds: 300),
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox(),
        );
      });
}

Widget buildOrDivider(ThemeData theme) {
  return Row(
    children: [
      Expanded(child: Divider(color: theme.colorScheme.onSecondaryFixed)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          'or',
          style: theme.textTheme.bodySmall,
        ),
      ),
      Expanded(child: Divider(color: theme.colorScheme.onSecondaryFixed)),
    ],
  );
}
