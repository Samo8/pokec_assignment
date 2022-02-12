import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokec_assignment/app/book_detail/ports/book_detail_service.dart';
import 'package:pokec_assignment/models/book_detail.dart';

part 'book_detail_event.dart';
part 'book_detail_state.dart';

class BookDetailBloc extends Bloc<BookDetailEvent, BookDetailState> {
  final BookDetailService bookDetailService;
  BookDetailBloc(this.bookDetailService) : super(BookDetailInitial()) {
    on<BookDetailEvent>((event, emit) async {
      if (event is FetchBookDetailEvent) {
        emit(BookDetailLoading());
        try {
          final bookDetail =
              await bookDetailService.fetchBookDetail(event.isbn);
          emit(BookDetailFetched(bookDetail));
        } on BookDetailError catch (e) {
          emit(BookDetailError(e.error));
        } catch (_) {
          emit(
            const BookDetailError('There was an error, try again later please'),
          );
        }
      }
      if (event is BookDetailErrorEvent) {
        emit(BookDetailError(event.error));
      }
    });
  }
}
