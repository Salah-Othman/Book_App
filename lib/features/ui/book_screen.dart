import 'package:books_app/core/constants/app_colors.dart';
import 'package:books_app/shared/custom_text.dart';
import 'package:books_app/shared/list_allbook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
            size: 20.sp,
          ),
        ),
        title: CustomText(
          text: 'Books',
          size: 16.sp,
          weight: FontWeight.w600,
          color: AppColors.primaryColor,
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 21.5.h),

            ListAllbook(),
            SizedBox(height: 21.5.h),
            ListAllbook(),
          ],
        ),
      ),
    );
  }
}
