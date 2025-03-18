import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  final String? buttonText;
  final String message;
  final void Function()? onButtonPressed;

  const SuccessDialog({
    super.key,
    required this.message,
    this.buttonText = 'ok',
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             Icon(
              Icons.check_circle,
              color: theme.colorScheme.primary,
              size: 48.0,
            ),
            const SizedBox(height: 16.0),
             Text(
              'Success',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            Text(
              message,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: onButtonPressed ??
                  () {
                    Navigator.pop(context);
                  },
              style: ElevatedButton.styleFrom(
                backgroundColor:theme.colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                buttonText!,
                style: theme.textTheme.bodySmall!.copyWith(color: theme.colorScheme.onError),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
