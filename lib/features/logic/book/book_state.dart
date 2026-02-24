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

///==========================================================================
/// Search
class SearchInitial extends BookState {}

class SearchLoading extends BookState {}

class SearchSuccess extends BookState {
  final List<Book> books;
  final String searchQuery;

  const SearchSuccess({required this.books, required this.searchQuery});

  @override
  List<Object?> get props => [books, searchQuery];
}

class SearchEmpty extends BookState {
  final String searchQuery;

  const SearchEmpty({required this.searchQuery});

  @override
  List<Object?> get props => [searchQuery];
}

class SearchError extends BookState {
  final String message;

  const SearchError({required this.message});

  @override
  List<Object?> get props => [message];
}
