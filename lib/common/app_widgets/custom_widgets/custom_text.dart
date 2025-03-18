import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

  const CustomText(
      {super.key,
      required this.text,
      this.size,
      this.color,
      this.fontWeight,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          overflow: overflow,
          fontSize: size ?? 20,
          fontWeight: fontWeight ?? FontWeight.bold,
          color: color ?? Colors.black),
    );
  }
}
