import 'package:books_app/core/network/dio_helper.dart';
import 'package:books_app/features/logic/book/book_state.dart';
import 'package:books_app/features/model/book_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookCubit extends Cubit<BookState> {
  

  BookCubit() : super(BookInitial());
  List<Book> allBooks = [];
  List<Book> topBooks = [];
  List<Book> randomBooks = [];

  /// Get Top Random Books
  Future<void> getRandomBooks() async {
    try {
      emit(BookLoading());

      final response = await DioHelper.getData(url: "books");

      final List<dynamic> data = response.data;

      randomBooks = Book.listFromJson(data);

      emit(BookSuccess(randomBooks));
    } on DioException catch (e) {
      emit(BookError(e.message ?? "Network Error"));
    }
  }

  /// Get All Books
  Future<void> getAllBooks() async {
    try {
      emit(BookLoading());

      final response = await DioHelper.getData(url: "books");

      final List<dynamic> data = response.data;

      allBooks = Book.listFromJson(data);

      emit(BookSuccess(allBooks));
    } on DioException catch (e) {
      emit(BookError(e.message ?? "Network Error"));
    }
  }

  /// Get Top 3 Book
  Future<void> getTopBooks() async {
    try {
      emit(BookLoading());

      final response = await DioHelper.getData(url: "books", query: {"max": 3});

      final List<dynamic> data = response.data;

      topBooks = Book.listFromJson(data);

      emit(BookSuccess(topBooks));
    } on DioException catch (e) {
      emit(BookError(e.message ?? "Network Error"));
    }
  }
}
