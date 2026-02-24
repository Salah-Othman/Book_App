import 'package:books_app/core/constants/app_colors.dart';
import 'package:books_app/features/logic/book/book_cubit.dart';
import 'package:books_app/features/logic/book/book_state.dart';
import 'package:books_app/features/ui/book_screen.dart';
import 'package:books_app/features/ui/details_screen.dart';
import 'package:books_app/shared/custom_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopBook extends StatelessWidget {
  const TopBook({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookCubit(Dio())..getTopBooks(),
      child: Column(
        children: [
          SizedBox(height: 65.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'All Books',
                  size: 20.sp,
                  weight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (c) => BookScreen()),
                    );
                  },
                  child: CustomText(
                    text: 'See More',
                    size: 14,
                    weight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),

          BlocBuilder<BookCubit, BookState>(
            builder: (context, state) {
              if (state is BookLoading) {
                return Center(child: Text('Loading ... '));
              } else if (state is BookSuccess) {
                final book = state.books;
                return SizedBox(
                  height: 294.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: book.length,
                    itemBuilder: (context, index) {
                      final topbook = book[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) => DetailsScreen(
                                  image: topbook.cover,
                                  title: topbook.title,
                                  description: topbook.description,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 180.w,
                            height: 288.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromRGBO(184, 184, 184, 1),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 10),
                                  width: 180.w,
                                  height: 140.h,
                                  child: Center(
                                    child: Image.network(topbook.cover),
                                  ),
                                ),
                                Container(
                                  width: 180.w,
                                  height: 154.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.primaryColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: 'Classics',
                                          size: 11.sp,
                                          weight: FontWeight.w300,
                                          color: AppColors.secondryColor,
                                        ),
                                        CustomText(
                                          text: topbook.title,
                                          size: 15.sp,
                                          weight: FontWeight.w600,
                                          color: AppColors.secondaryText,
                                        ),
                                        SizedBox(height: 6.h),
                                        CustomText(
                                          text: 'Oscar Wilde',
                                          size: 11.sp,
                                          weight: FontWeight.w400,
                                          color: AppColors.secondryColor,
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is BookError) {
                return Center(child: Text(state.message));
              } else {
                return Center(child: Text('Error Load data'));
              }
            },
          ),
        ],
      ),
    );
  }
}
