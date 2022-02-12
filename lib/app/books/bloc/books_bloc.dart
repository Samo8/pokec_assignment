import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokec_assignment/app/books/ports/books_service.dart';
import 'package:pokec_assignment/models/book.dart';
import 'package:pokec_assignment/models/books_info.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final BooksService booksService;
  BooksBloc({
    required this.booksService,
  }) : super(
          const BooksState(booksInfo: BooksInfo(total: '', books: <Book>[])),
        ) {
    on<BooksEvent>((event, emit) async {
      if (event is FetchBooksEvent) {
        emit(state.copyWith(isLoading: true));
        final books = await booksService.fetchBooks(
          text: event.text,
          page: 1,
        );
        emit(
          state.copyWith(
            isLoading: false,
            booksInfo: books,
          ),
        );
      }
      if (event is FetchBooksPageEvent) {
        final totalBooks = int.tryParse(state.booksInfo.total);
        if (totalBooks != null && state.booksInfo.books.length >= totalBooks) {
          return;
        }
        final booksInfo = await booksService.fetchBooks(
          text: event.text,
          page: event.page,
        );
        final books = booksInfo.books;

        emit(
          state.copyWith(
            booksInfo: BooksInfo(
              total: state.booksInfo.total,
              books: [...state.booksInfo.books, ...books],
            ),
            page: event.page,
          ),
        );
      }
    });
  }
}
