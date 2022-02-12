import 'package:pokec_assignment/app/book_detail/adapters/book_detail_api_client_interface.dart';
import 'package:pokec_assignment/app/exceptions/book_detail_exception.dart';
import 'package:pokec_assignment/http/custom_http_client.dart';
import 'package:pokec_assignment/models/book_detail.dart';

class BookDetailHttpClient extends IBookDetailApiClient {
  @override
  Future<BookDetail> fetchBookDetail(String isbn) async {
    final response = await CustomDio().client.get<Map<String, dynamic>>(
          '/books/$isbn',
        );
    final data = response.data;
    if (data == null) {
      throw const BookDetailException('Book data not present');
    }
    return BookDetail.fromJson(data);
  }
}
