import 'package:books_app/features/model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class SearchBookState extends Equatable {
  const SearchBookState();

  @override
  List<Object?> get props => [];
}
class SearchBookInitial extends SearchBookState {}

class SearchBookLoading extends SearchBookState {}

class SearchBookSuccess extends SearchBookState {
  final List<Book> books;

  const SearchBookSuccess(this.books);

  @override
  List<Object?> get props => [books];
}

class SearchBookError extends SearchBookState {
  final String message;

  const SearchBookError(this.message);

  @override
  List<Object?> get props => [message];
}
