import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final double? fontSize;
  final int? maxLines;
  final TextInputType? keyboardType; // Added keyboardType parameter

  const AppTextFormField({
    required this.hintText,
    this.icon,
    this.fontWeight,
    this.color,
    this.fontFamily,
    this.fontSize,
    this.maxLines,
    this.keyboardType, // Updated constructor
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: keyboardType, // Set keyboardType
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: fontSize ?? 13,
          fontFamily: fontFamily ?? 'Poppins',
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? AppColors.textColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.bgColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        prefixIcon: icon != null ? Icon(icon) : null,
      ),
    );
  }
}
