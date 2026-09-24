import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/error/exception.dart';
import 'package:number_trivia/core/error/exceptions_mapper.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:number_trivia/core/network/network_info.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NetworkInfo networkInfo;
  final NumberTriviaRemoteDataSource numberTriviaRemoteDataSource;
  final NumberTriviaLocalDataSource numberTriviaLocalDataSource;

  NumberTriviaRepositoryImpl({
    required this.networkInfo,
    required this.numberTriviaRemoteDataSource,
    required this.numberTriviaLocalDataSource,
  });
  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
    int number,
  ) async {
    try {
      if (await networkInfo.isConnected()) {
        final result = await numberTriviaRemoteDataSource
            .getConcreteNumberTrivia(number);
        return Right(result);
      } else {
        final results = await numberTriviaLocalDataSource
            .getCachedNumberTrivias();
        if (results.isEmpty) return Left(NetworkFailure());
        return Right(results.first);
      }
    } on CustomException catch (e) {
      return Left(fromExceptionToFailure(e));
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
    try {
      if (await networkInfo.isConnected()) {
        final result = await numberTriviaRemoteDataSource
            .getRandomNumberTrivia();
        return Right(result);
      } else {
        final results = await numberTriviaLocalDataSource
            .getCachedNumberTrivias();
        if (results.isEmpty) Left(NetworkFailure());
        return Right(results.first);
      }
    } on CustomException catch (e) {
      return Left(fromExceptionToFailure(e));
    } on NetworkFailure {
      rethrow;
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }
}
