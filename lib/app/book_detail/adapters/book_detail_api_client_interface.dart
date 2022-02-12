import 'package:pokec_assignment/models/book_detail.dart';

abstract class IBookDetailApiClient {
  Future<BookDetail> fetchBookDetail(String isbn);
}
