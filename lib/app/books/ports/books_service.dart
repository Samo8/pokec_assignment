import 'package:pokec_assignment/app/books/adapters/books_api_client_interface.dart';
import 'package:pokec_assignment/models/book.dart';
import 'package:pokec_assignment/models/books_info.dart';

class BooksService {
  final IBooksApiClient booksApiClient;

  const BooksService(this.booksApiClient);

  Future<BooksInfo> fetchBooks({
    required String text,
    required int page,
  }) async {
    try {
      return await booksApiClient.fetchBooks(text: text, page: page);
    } catch (e) {
      return const BooksInfo(total: '', books: <Book>[]);
    }
  }
}
