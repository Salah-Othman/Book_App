import 'package:books_app/core/constants/app_colors.dart';
import 'package:books_app/features/ui/book_screen.dart';
import 'package:books_app/features/ui/details_screen.dart';
import 'package:books_app/features/ui/search_screen.dart';
import 'package:books_app/shared/best_deals.dart';
import 'package:books_app/shared/custom_text.dart';
import 'package:books_app/shared/top_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16.h),

            /// Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Happy Reading!',
                    size: 16.sp,
                    weight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (c) => SearchScreen()),
                      );
                    },
                    icon: Icon(
                      Icons.search,
                      color: AppColors.primaryColor,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 58.h),

            /// Best Deals
            BestDeals(),

            /// Books
            TopBook(),
          ],
        ),
      ),
    );
  }
}
