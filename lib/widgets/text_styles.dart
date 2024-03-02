//For Heading text
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppMainText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final double? fontSize;

  const AppMainText({
    Key? key,
    required this.text,
    this.fontWeight,
    this.color,
    this.fontFamily,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontFamily: fontFamily ?? 'Poppins',
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? AppColors.textColor,
      ),
    );
  }
}

//For Normal text
class AppLiteText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final double? fontSize;

  const AppLiteText({
    Key? key,
    required this.text,
    this.fontWeight,
    this.color,
    this.fontFamily,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 13,
        fontFamily: fontFamily ?? 'Poppins',
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? AppColors.textColor,
      ),
    );
  }
}
