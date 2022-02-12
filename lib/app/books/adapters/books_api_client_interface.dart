import 'package:pokec_assignment/models/books_info.dart';

abstract class IBooksApiClient {
  Future<BooksInfo> fetchBooks({
    required String text,
    required int page,
  });
}
