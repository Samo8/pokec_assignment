part of 'books_bloc.dart';

class BooksState extends Equatable {
  final BooksInfo booksInfo;
  // final List<Book> books;
  final bool isLoading;
  final int page;

  const BooksState({
    required this.booksInfo,
    // required this.books,
    this.isLoading = false,
    this.page = 1,
  });

  @override
  List<Object> get props => [booksInfo, isLoading, page];

  @override
  bool get stringify => true;

  BooksState copyWith({
    BooksInfo? booksInfo,
    bool? isLoading,
    int? page,
  }) {
    return BooksState(
      booksInfo: booksInfo ?? this.booksInfo,
      isLoading: isLoading ?? this.isLoading,
      page: page ?? this.page,
    );
  }
}
