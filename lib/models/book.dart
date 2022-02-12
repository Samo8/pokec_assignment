import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Book extends Equatable {
  final String title;
  final String subtitle;
  @JsonKey(name: 'isbn13')
  final String isbn;
  final String price;
  final String image;
  final String url;

  const Book({
    required this.title,
    required this.subtitle,
    required this.isbn,
    required this.price,
    required this.image,
    required this.url,
  });

  Book copyWith({
    String? title,
    String? subtitle,
    String? isbn,
    String? price,
    String? image,
    String? url,
  }) {
    return Book(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isbn: isbn ?? this.isbn,
      price: price ?? this.price,
      image: image ?? this.image,
      url: url ?? this.url,
    );
  }

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);

  @override
  List<Object> get props => [
        title,
        subtitle,
        isbn,
        price,
        image,
        url,
      ];
}
