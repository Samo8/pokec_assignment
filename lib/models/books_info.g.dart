// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooksInfo _$BooksInfoFromJson(Map<String, dynamic> json) => BooksInfo(
      total: json['total'] as String,
      books: (json['books'] as List<dynamic>)
          .map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BooksInfoToJson(BooksInfo instance) => <String, dynamic>{
      'total': instance.total,
      'books': instance.books,
    };
