// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDetail _$BookDetailFromJson(Map<String, dynamic> json) => BookDetail(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      isbn: json['isbn13'] as String,
      price: json['price'] as String,
      image: json['image'] as String,
      url: json['url'] as String,
      authors: json['authors'] as String,
      pages: json['pages'] as String,
      year: json['year'] as String,
    );

Map<String, dynamic> _$BookDetailToJson(BookDetail instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'isbn13': instance.isbn,
      'price': instance.price,
      'image': instance.image,
      'url': instance.url,
      'authors': instance.authors,
      'pages': instance.pages,
      'year': instance.year,
    };
