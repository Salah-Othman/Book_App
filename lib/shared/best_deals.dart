import 'package:books_app/core/constants/app_colors.dart';
import 'package:books_app/features/logic/book/book_cubit.dart';
import 'package:books_app/features/logic/book/book_state.dart';
import 'package:books_app/features/ui/details_screen.dart';
import 'package:books_app/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestDeals extends StatelessWidget {
  const BestDeals({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookCubit()..getRandomBooks(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Best Deals',
              size: 20.sp,
              weight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 28.h),
            BlocBuilder<BookCubit, BookState>(
              builder: (context, state) {
                if (state is BookLoading) {
                  return Center(child: Text('Loading ... '));
                } else if (state is BookSuccess) {
                  final bestDeals = state.books;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            image: bestDeals[0].cover,
                            title: bestDeals[0].title,
                            description: bestDeals[0].description,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 320.w,
                      height: 140.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primaryColor,
                      ),
                      child: Row(
                        children: [
                          Image.network(bestDeals[0].cover),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Novel',
                                  size: 11.sp,
                                  weight: FontWeight.w300,
                                  color: AppColors.secondryColor,
                                ),
                                CustomText(
                                  text: bestDeals[0].title,
                                  size: 10.4.sp,
                                  weight: FontWeight.w600,
                                  color: AppColors.secondaryText,
                                ),
                                SizedBox(height: 8.h),
                                CustomText(
                                  text: 'Kate Racculia',
                                  size: 11.sp,
                                  weight: FontWeight.w400,
                                  color: AppColors.secondaryText,
                                ),
                                SizedBox(height: 7.h),
                                CustomText(
                                  text: '\$33.00',
                                  size: 21.sp,
                                  weight: FontWeight.w600,
                                  color: AppColors.secondaryText,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (state is BookError) {
                  return Center(child: Text(state.message));
                } else {
                  return Center(child: Text('Error loading books'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
