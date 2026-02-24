import 'package:books_app/core/constants/app_colors.dart';
import 'package:books_app/shared/custom_text.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.onTap,
  });
  final double width, height;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.primaryColor,
        ),
        child: Center(
          child: CustomText(
            text: text,
            size: 14,
            weight: FontWeight.w600,
            color: AppColors.backgroundColor,
          ),
        ),
      ),
    );
  }
}
