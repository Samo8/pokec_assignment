import 'package:pokec_assignment/app/book_detail/adapters/book_detail_api_client_interface.dart';
import 'package:pokec_assignment/models/book_detail.dart';

class BookDetailService {
  final IBookDetailApiClient bookDetailApiClientl;

  const BookDetailService(this.bookDetailApiClientl);

  Future<BookDetail> fetchBookDetail(String isbn) async {
    return await bookDetailApiClientl.fetchBookDetail(isbn);
  }
}
