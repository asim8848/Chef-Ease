import 'package:chefease/constants/responsive.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final bool isLoading; // New parameter

  const CustomButton({
    Key? key,
    required this.text,
    this.icon,
    required this.onPressed,
    this.width = 0.8,
    this.height = 0.06,
    this.borderRadius = 5,
    this.backgroundColor = AppColors.primaryColor,
    this.textColor = AppColors.secondaryColor,
    this.isLoading = false, // Default value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.screenWidth(context) * width,
      height: Responsive.screenHeight(context) * height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed, // Disable button when loading
        child: isLoading
            ? CircularProgressIndicator(
                // Show loading indicator when loading
                valueColor: AlwaysStoppedAnimation<Color>(textColor),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) Icon(icon, color: textColor, size: 20),
                  SizedBox(width: 8),
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
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
