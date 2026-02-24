import 'package:books_app/features/logic/book/book_state.dart';
import 'package:books_app/features/model/book_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookCubit extends Cubit<BookState> {
  final Dio dio;

  BookCubit(this.dio) : super(BookInitial());

  /// Get Top Random Books
  Future<void> getRandomBooks() async {
    try {
      emit(BookLoading());
      final Response response = await dio.get(
        'https://potterapi-fedeperin.vercel.app/en/books/random',
      );
      Book randomBook = Book.fromJson(response.data);
      emit(BookSuccess([randomBook]));
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }

  /// Get All Books
  Future<void> getAllBooks() async {
    try {
      emit(BookLoading());
      final Response response = await dio.get(
        'https://potterapi-fedeperin.vercel.app/en/books',
      );
      List<Book> allBooks = Book.listFromJson(response.data);
      emit(BookSuccess(allBooks));
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }

  /// Get Top 3 Book
  Future<void> getTopBooks() async {
    try {
      emit(BookLoading());
      final Response response = await dio.get(
        'https://potterapi-fedeperin.vercel.app/en/books?max=3',
      );
      List<Book> topBooks = Book.listFromJson(response.data);
      emit(BookSuccess(topBooks));
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }
  /// Search
}
