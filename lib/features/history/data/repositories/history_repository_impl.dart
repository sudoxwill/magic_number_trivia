import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:number_trivia/features/history/domain/repositories/history_repository.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final NumberTriviaLocalDataSource numberTriviaLocalDataSource;

  HistoryRepositoryImpl(this.numberTriviaLocalDataSource);
  @override
  Future<Either<Failure, List<NumberTrivia>>> getNumberTriviaHistory() async {
    try {
      final result = await numberTriviaLocalDataSource.getCachedNumberTrivias();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
