import 'package:pokec_assignment/models/books_info.dart';

abstract class IBooksApiClient {
  Future<BooksInfo> fetchBooksInfo({
    required String text,
    required int page,
  });
}
