import 'package:books_app/core/network/dio_helper.dart';
import 'package:books_app/features/logic/search/search_state.dart';
import 'package:books_app/features/model/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit() : super(SearchBookInitial());

  List<Book> allBooks = [];

  /// Get All Books
  Future<void> getBooks() async {
    try {
      emit(SearchBookLoading());

      final response = await DioHelper.getData(url: "books");

      final List<dynamic> data = response.data;

      allBooks = Book.listFromJson(data);

      emit(SearchBookSuccess(allBooks));
    } on DioException catch (e) {
      emit(SearchBookError(e.message ?? "Network Error"));
    }
  }

  /// Search From API
  Future<void> searchBooks(String query) async {
    if (query.isEmpty) {
      emit(SearchBookSuccess(allBooks));
      return;
    }

    try {
      emit(SearchBookLoading());

      final response = await DioHelper.getData(
        url: "books",
        query: {"search": query},
      );

      final List<dynamic> data = response.data;

      final books = Book.listFromJson(data);

      emit(SearchBookSuccess(books));
    } on DioException catch (e) {
      emit(SearchBookError(e.message ?? "Search Error"));
    }
  }
}
