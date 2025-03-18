import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final Color? backGroundColor;
  final Color? forgroundColor;
  final void Function()? onPressed;
  final double? verticalPadding;
final ThemeData theme;
  const CustomButton(
      {super.key,
      this.child,
      this.onPressed,
      this.height,
      this.width,
      this.backGroundColor ,
      this.verticalPadding=0, this.forgroundColor, required this.theme});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: verticalPadding!,horizontal: 12),
          backgroundColor: backGroundColor??theme.colorScheme.primary,
          foregroundColor: forgroundColor??theme.colorScheme.onError,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
