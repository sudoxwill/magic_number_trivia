import 'package:number_trivia/core/error/exception.dart';
import 'package:number_trivia/features/history/domain/repositories/history_repository.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final NumberTriviaLocalDataSource numberTriviaLocalDataSource;

  HistoryRepositoryImpl(this.numberTriviaLocalDataSource);
  @override
  Future<List<NumberTrivia>> getNumberTriviaHistory() {
    try {
      return numberTriviaLocalDataSource.getCachedNumberTrivias();
    } catch (e) {
      throw CacheException();
    }
  }
}
