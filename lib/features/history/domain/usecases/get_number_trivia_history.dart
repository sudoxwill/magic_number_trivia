import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/features/history/domain/repositories/history_repository.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

class GetNumberTriviaHistory extends Usecase<List<NumberTrivia>, NoParam> {
  final HistoryRepository historyRepository;

  GetNumberTriviaHistory(this.historyRepository);

  @override
  Future<List<NumberTrivia>> call(NoParam param) async {
    return await historyRepository.getNumberTriviaHistory();
  }
}
