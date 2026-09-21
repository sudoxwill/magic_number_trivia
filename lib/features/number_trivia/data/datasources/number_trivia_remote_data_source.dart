import 'package:dio/dio.dart';
import 'package:number_trivia/core/error/exception.dart';
import 'package:number_trivia/core/error/exceptions_mapper.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final NumberTriviaLocalDataSource numberTriviaLocalDataSource;
  final Dio dio;

  NumberTriviaRemoteDataSourceImpl({
    required this.numberTriviaLocalDataSource,
    required this.dio,
  });
  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async {
    try {
      final response = await dio.get(
        '/$number',
        options: Options(headers: {'Accept': 'application/json'}),
      );
      final data = response.data as Map<String, dynamic>;
      if (!data['found']) {
        throw NotFoundException(); // Pas nécessaire mais pourquoi pas...
      }
      final numberTrivia = NumberTriviaModel.fromJson(data);
      numberTriviaLocalDataSource.cacheNumberTrivia(numberTrivia);
      return numberTrivia;
    } on DioException catch (e) {
      throw fromDioToException(e);
    }
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async {
    try {
      final response = await dio.get(
        '/random/trivia',
        options: Options(headers: {'Accept': 'application/json'}),
      );
      final data = response.data as Map<String, dynamic>;
      if (!data['found']) {
        throw NotFoundException(); // Pas nécessaire mais pourquoi pas...
      }
      final numberTrivia = NumberTriviaModel.fromJson(data);
      numberTriviaLocalDataSource.cacheNumberTrivia(numberTrivia);
      return numberTrivia;
    } on DioException catch (e) {
      throw fromDioToException(e);
    }
  }
}
