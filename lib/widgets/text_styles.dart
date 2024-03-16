import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../constants/responsive.dart';

class AppMainText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final double? fontSize;
  final TextAlign textAlign;

  const AppMainText({
    Key? key,
    required this.text,
    this.fontWeight,
    this.color,
    this.fontFamily,
    this.fontSize,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: _buildTextStyle(context),
    );
  }

  TextStyle _buildTextStyle(BuildContext context) {
    if (fontFamily != null) {
      // Use custom local font if fontFamily is provided
      return TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize ?? Responsive.screenWidth(context) * 0.05,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? AppColors.textColor,
      );
    } else {
      // Default to Google Fonts Poppins
      return GoogleFonts.poppins(
        fontSize: fontSize ?? Responsive.screenWidth(context) * 0.05,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? AppColors.textColor,
      );
    }
  }
}

class AppLiteText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final double? fontSize;
  final TextAlign textAlign;

  const AppLiteText({
    Key? key,
    required this.text,
    this.fontWeight,
    this.color,
    this.fontFamily,
    this.fontSize,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: _buildTextStyle(context),
    );
  }

  TextStyle _buildTextStyle(BuildContext context) {
    if (fontFamily != null) {
      // Use custom local font if fontFamily is provided
      return TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize ?? Responsive.screenWidth(context) * 0.04,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? AppColors.textColor,
      );
    } else {
      // Default to Google Fonts Poppins
      return GoogleFonts.poppins(
        fontSize: fontSize ?? Responsive.screenWidth(context) * 0.04,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? AppColors.textColor,
      );
    }
  }
}
