import 'package:books_app/core/constants/app_colors.dart';
import 'package:books_app/features/logic/search/search_cubit.dart';
import 'package:books_app/features/logic/search/search_state.dart';
import 'package:books_app/features/ui/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchBookCubit>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Search title/author/ISBN no',
                    hintStyle: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14.sp,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.primaryColor,
                    ),
                    fillColor: AppColors.secondryColor,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (value) {
                    cubit.searchBooks(value);
                  },
                ),
              ),
              BlocBuilder<SearchBookCubit, SearchBookState>(
                builder: (context, state) {
                  if (state is SearchBookLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is SearchBookSuccess) {
                    return SizedBox(
                      height: 600.h,
                      child: ListView.builder(
                        itemCount: state.books.length,
                        itemBuilder: (context, index) {
                          final book = state.books[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (c) => DetailsScreen(
                                    image: book.cover,
                                    title: book.title,
                                    description: book.description,
                                  ),
                                ),
                              );
                            },
                            child: ListTile(
                              leading: Image.network(book.cover),
                              title: Text(book.title),
                              subtitle: Text(book.releaseDate),
                            ),
                          );
                        },
                      ),
                    );
                  }

                  if (state is SearchBookError) {
                    return Center(child: Text(state.message));
                  }

                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
