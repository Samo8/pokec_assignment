import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokec_assignment/models/book.dart';

part 'books_info.g.dart';

@JsonSerializable()
class BooksInfo extends Equatable {
  final String total;
  final List<Book> books;

  const BooksInfo({
    required this.total,
    required this.books,
  });

  BooksInfo copyWith({
    String? total,
    List<Book>? books,
  }) {
    return BooksInfo(
      total: total ?? this.total,
      books: books ?? this.books,
    );
  }

  factory BooksInfo.fromJson(Map<String, dynamic> json) =>
      _$BooksInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BooksInfoToJson(this);

  @override
  List<Object> get props => [
        total,
        books,
      ];
}
