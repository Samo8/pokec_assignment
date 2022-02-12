part of 'book_detail_bloc.dart';

abstract class BookDetailState extends Equatable {
  const BookDetailState();

  @override
  List<Object> get props => [];
}

class BookDetailInitial extends BookDetailState {}

class BookDetailLoading extends BookDetailState {}

class BookDetailFetchBook extends BookDetailState {
  final String isbn;

  const BookDetailFetchBook(this.isbn);

  @override
  List<Object> get props => [isbn];
}

class BookDetailFetched extends BookDetailState {
  final BookDetail bookDetail;

  const BookDetailFetched(this.bookDetail);

  @override
  List<Object> get props => [bookDetail];
}

class BookDetailError extends BookDetailState {
  final String error;

  const BookDetailError(this.error);

  @override
  List<Object> get props => [error];
}
