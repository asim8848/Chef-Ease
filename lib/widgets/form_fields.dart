import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final Widget? suffixIcon; // Change suffixIcon to Widget?
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final double? fontSize;
  final int? maxLines;
  final TextInputType? keyboardType;

  final TextEditingController? controller; // Add controller parameter
  final bool obscureText; // Add obscureText parameter with default value

  final bool obscureText;

  const AppTextFormField({
    required this.hintText,
    this.icon,
    this.suffixIcon, // Change suffixIcon to Widget?
    this.fontWeight,
    this.color,
    this.fontFamily,
    this.fontSize,
    this.maxLines,
    this.keyboardType,
    this.controller, // Provide controller parameter
    this.obscureText = false, // Provide default value

    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // Assign controller to TextFormField
      maxLines: obscureText ? 1 : maxLines,
      keyboardType: keyboardType,
      obscureText: obscureText,
      textAlignVertical: TextAlignVertical.center, // Center the text vertically
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: fontSize ?? 13,
          fontFamily: fontFamily ?? 'Poppins',
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? AppColors.textColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: AppColors.bgColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        prefixIcon: icon != null ? Icon(icon) : null,
        suffixIcon: suffixIcon, // Use suffixIcon directly
      ),
    );
  }
}
