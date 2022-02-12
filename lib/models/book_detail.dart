import 'package:json_annotation/json_annotation.dart';
import 'package:pokec_assignment/models/book.dart';

part 'book_detail.g.dart';

@JsonSerializable()
class BookDetail extends Book {
  final String authors;
  final String pages;
  final String year;

  const BookDetail({
    required String title,
    required String subtitle,
    required String isbn,
    required String price,
    required String image,
    required String url,
    required this.authors,
    required this.pages,
    required this.year,
  }) : super(
          title: title,
          subtitle: subtitle,
          isbn: isbn,
          price: price,
          image: image,
          url: url,
        );

  @override
  BookDetail copyWith({
    String? title,
    String? subtitle,
    String? isbn,
    String? price,
    String? image,
    String? url,
    String? authors,
    String? pages,
    String? year,
  }) {
    return BookDetail(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      authors: authors ?? this.authors,
      isbn: isbn ?? this.isbn,
      pages: pages ?? this.pages,
      year: year ?? this.year,
      price: price ?? this.price,
      image: image ?? this.image,
      url: url ?? this.url,
    );
  }

  factory BookDetail.empty() => const BookDetail(
        title: '',
        subtitle: '',
        pages: '',
        authors: '',
        image: '',
        price: '',
        isbn: '',
        url: '',
        year: '',
      );

  factory BookDetail.fromJson(Map<String, dynamic> json) =>
      _$BookDetailFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BookDetailToJson(this);

  @override
  List<Object> get props => [
        title,
        subtitle,
        isbn,
        price,
        image,
        url,
        authors,
        pages,
        year,
      ];
}
