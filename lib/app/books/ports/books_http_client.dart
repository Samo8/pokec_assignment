import 'package:pokec_assignment/app/books/adapters/books_api_client_interface.dart';
import 'package:pokec_assignment/app/exceptions/books_fetch_exception.dart';
import 'package:pokec_assignment/http/custom_http_client.dart';
import 'package:pokec_assignment/models/books_info.dart';

class BooksHttpClient extends IBooksApiClient {
  @override
  Future<BooksInfo> fetchBooks({
    required String text,
    required int page,
  }) async {
    try {
      final response = await CustomDio().client.get<Map<String, dynamic>>(
            '/search/$text/$page',
          );
      final data = response.data;
      if (data == null) {
        throw const BooksFetchException('Could not parse books');
      }
      return BooksInfo.fromJson(data);
    } catch (e) {
      throw BooksFetchException(e.toString());
    }
  }
}
