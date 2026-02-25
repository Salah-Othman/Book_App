import 'package:books_app/core/constants/app_colors.dart';
import 'package:books_app/features/logic/book/book_state.dart';
import 'package:books_app/features/logic/search/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchBookCubit>();

    return Scaffold(
      body: SafeArea(
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
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(Icons.search, color: AppColors.primaryColor),
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
            BlocBuilder<SearchBookCubit, BookState>(
              builder: (context, state) {
                if (state is BookLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is BookSuccess) {
                  return SizedBox(
                    height: 600,
                    child: ListView.builder(
                      itemCount: state.books.length,
                      itemBuilder: (context, index) {
                        final book = state.books[index];

                        return ListTile(
                          leading: Image.network(book.cover),
                          title: Text(book.title),
                          subtitle: Text("${book.pages} pages"),
                        );
                      },
                    ),
                  );
                }

                if (state is BookError) {
                  return Center(child: Text(state.message));
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
