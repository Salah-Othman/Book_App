import 'package:books_app/core/constants/app_colors.dart';
import 'package:books_app/features/ui/home_screen.dart';
import 'package:books_app/shared/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/book.png',
                width: 450.w,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 363.h,
                left: 111.w,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    width: 136.w,
                    height: 136.h,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              maxLines: 3,
              textAlign: TextAlign.center,
              'Read more and stress less with our online book\nshopping app. Shop from anywhere you are and\ndiscover titles that you love. Happy reading!',
              style: TextStyle(
                letterSpacing: -0.41,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryText,
              ),
            ),
          ),
          SizedBox(height: 87.h),
          CustomBtn(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (c) => HomeScreen()),
              );
            },
            text: 'Get Started',
            height: 56.h,
            width: 320.w,
          ),
        ],
      ),
    );
  }
}
