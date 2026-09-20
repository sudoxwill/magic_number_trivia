import 'package:dio/dio.dart';

Dio createDioInstance() => Dio(
  BaseOptions(
    baseUrl: 'http://www.number-trivia.com',
    connectTimeout: Duration(seconds: 30),
    sendTimeout: Duration(seconds: 30),
  ),
);
