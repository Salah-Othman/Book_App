import 'package:books_app/features/model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object?> get props => [];
}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookSuccess extends BookState {
  final List<Book> books;

  const BookSuccess(this.books);

  @override
  List<Object?> get props => [books];
}

class BookError extends BookState {
  final String message;

  const BookError(this.message);

  @override
  List<Object?> get props => [message];
}

