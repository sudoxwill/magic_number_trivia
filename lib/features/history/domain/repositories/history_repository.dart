import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

abstract class HistoryRepository {
  Future<List<NumberTrivia>> getNumberTriviaHistory();
}
