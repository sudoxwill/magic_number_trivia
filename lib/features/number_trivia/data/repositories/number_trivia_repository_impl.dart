import 'package:number_trivia/core/error/exception.dart';
import 'package:number_trivia/core/error/exceptions_mapper.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource numberTriviaRemoteDataSource;

  NumberTriviaRepositoryImpl({required this.numberTriviaRemoteDataSource});
  @override
  Future<NumberTrivia> getConcreteNumberTrivia(int number) async {
    try {
      return await numberTriviaRemoteDataSource.getConcreteNumberTrivia(number);
    } on CustomException catch (e) {
      throw fromExceptionToFailure(e);
    } catch (e) {
      throw UnexpectedFailure();
    }
  }

  @override
  Future<NumberTrivia> getRandomNumberTrivia() async {
    try {
      return await numberTriviaRemoteDataSource.getRandomNumberTrivia();
    } on CustomException catch (e) {
      throw fromExceptionToFailure(e);
    } catch (e) {
      throw UnexpectedFailure();
    }
  }
}
