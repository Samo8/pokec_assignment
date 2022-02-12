import 'package:dio/dio.dart';

class CustomDio {
  static final _migrationService = CustomDio._internal();
  factory CustomDio() => _migrationService;

  final Dio client;
  CustomDio._internal()
      : client = Dio()
          ..options = BaseOptions(
            baseUrl: 'https://api.itbook.store/1.0',
            connectTimeout: 5000,
            receiveTimeout: 3000,
          );
}
