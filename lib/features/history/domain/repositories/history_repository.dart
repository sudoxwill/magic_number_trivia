import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

abstract class HistoryRepository {
  Future<Either<Failure, List<NumberTrivia>>> getNumberTriviaHistory();
}
