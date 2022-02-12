part of 'books_bloc.dart';

abstract class BooksEvent extends Equatable {
  const BooksEvent();

  @override
  List<Object> get props => [];
}

class BooksLoadingEvent extends BooksEvent {}

class FetchBooksEvent extends BooksEvent {
  final String text;

  const FetchBooksEvent({
    required this.text,
  });

  @override
  List<Object> get props => [text];
}

class FetchBooksPageEvent extends BooksEvent {
  final String text;
  final int page;

  const FetchBooksPageEvent({
    required this.text,
    required this.page,
  });

  @override
  List<Object> get props => [text, page];
}
