import 'package:pokec_assignment/app/books/adapters/books_api_client_interface.dart';
import 'package:pokec_assignment/app/exceptions/books_fetch_exception.dart';
import 'package:pokec_assignment/http/custom_http_client.dart';
import 'package:pokec_assignment/models/book.dart';
import 'package:pokec_assignment/models/books_info.dart';

class BooksHttpClient extends IBooksApiClient {
  @override
  Future<BooksInfo> fetchBooks({
    required String text,
    required int page,
  }) async {
    try {
      final response = await CustomDio().client.get<Map<String, dynamic>>(
            '/search/$text',
          );
      // print(text);
      // final data = response.data?['books'] as List<dynamic>?;
      // print(data);
      // final books = data?.map((book) => Book.fromJson(book)).toList();
      // print(books);
      final data = response.data;
      if (data == null) {
        throw const BooksFetchException('Could not parse books');
      }
      return BooksInfo.fromJson(data);
      // if (books == null) {
      //   throw const BooksFetchException('Could not parse books');
      // }
      // return books;
    } catch (e) {
      print(e.toString());
      throw BooksFetchException(e.toString());
    }
  }
}
