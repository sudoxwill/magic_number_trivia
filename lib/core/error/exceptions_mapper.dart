import 'package:dio/dio.dart';
import 'package:number_trivia/core/error/exception.dart';
import 'package:number_trivia/core/error/failure.dart';

CustomException fromDioToException(DioException e) {
  return switch (e.type) {
    DioExceptionType.connectionError => NetworkException(),
    DioExceptionType.connectionTimeout => NetworkException(),
    DioExceptionType.sendTimeout => NetworkException(),
    DioExceptionType.receiveTimeout => ServerException(),
    DioExceptionType.badCertificate => ServerException(),
    DioExceptionType.badResponse => ServerException(),
    DioExceptionType.cancel => ServerException(),
    DioExceptionType.unknown => ServerException(),
    DioExceptionType.transformTimeout => NetworkException(),
  };
}

Failure fromExceptionToFailure(CustomException e) {
  return switch (e) {
    ServerException() => ServerFailure(),
    NetworkException() => NetworkFailure(),
    CacheException() => CacheFailure(),
    NotFoundException() => NotFoundFailure(),
  };
}
