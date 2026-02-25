import 'package:books_app/core/constants/app_colors.dart';
import 'package:books_app/shared/custom_btn.dart';
import 'package:books_app/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const DetailsScreen({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

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
          icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
        ),
        title: CustomText(
          text: 'Classics',
          size: 14,
          weight: FontWeight.w600,
          color: AppColors.primaryColor,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              CustomText(
                text: title,
                size: 24,
                weight: FontWeight.w600,
                color: AppColors.primaryColor,
                maxLines: 2,
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 214.h,
                child: Row(
                  children: [
                    Image.network(
                      image,
                      width: 130.w,
                      height: 214.h,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Author :',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.primaryText,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Oscar Wilde',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12.h),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Category :',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.primaryText,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Classics',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12.h),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Rating:',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.primaryText,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 4.11/5',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12.h),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Pricing :',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.primaryText,
                                  ),
                                ),
                                TextSpan(
                                  text: ' \$25.00',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                          CustomBtn(
                            text: 'Add to Cart',
                            height: 40.h,
                            width: 140.w,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.h),
              CustomText(
                text: 'Description:',
                size: 14.sp,
                weight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
              SizedBox(height: 10.h),
              CustomText(
                text: description,
                size: 14.sp,
                weight: FontWeight.w400,
                color: AppColors.primaryColor,
                maxLines: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
