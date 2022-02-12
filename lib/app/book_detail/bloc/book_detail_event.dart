part of 'book_detail_bloc.dart';

abstract class BookDetailEvent extends Equatable {
  const BookDetailEvent();

  @override
  List<Object> get props => [];
}

class BookDetailLoadingEvent extends BookDetailEvent {}

class FetchBookDetailEvent extends BookDetailEvent {
  final String isbn;

  const FetchBookDetailEvent(this.isbn);

  @override
  List<Object> get props => [isbn];
}

class BookDetailFetchedEvent extends BookDetailEvent {
  final BookDetail bookDetail;

  const BookDetailFetchedEvent(this.bookDetail);

  @override
  List<Object> get props => [bookDetail];
}

class BookDetailErrorEvent extends BookDetailEvent {
  final String error;

  const BookDetailErrorEvent(this.error);

  @override
  List<Object> get props => [error];
}
