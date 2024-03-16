import 'package:chefease/constants/responsive.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData? icon; // Added icon parameter
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double borderRadius;
  final Color backgroundColor;
  final Color textColor;

  const CustomButton({
    Key? key,
    required this.text,
    this.icon, // Updated constructor to include icon parameter
    required this.onPressed,
    this.width = 0.8,
    this.height = 0.06,
    this.borderRadius = 5,
    this.backgroundColor = AppColors.primaryColor,
    this.textColor = AppColors.secondaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == 0.8
          ? Responsive.screenWidth(context) * 0.8
          : Responsive.screenWidth(context) * width,
      height: height == 0.6
          ? Responsive.screenHeight(context) * 0.06
          : Responsive.screenHeight(context) * height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          // Use Row to display icon and text horizontally
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) // Conditionally add icon if provided
              Icon(icon, color: textColor, size: 20),
            SizedBox(width: 8), // Add some space between icon and text
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius == 5
                ? BorderRadius.circular(5)
                : BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
