import 'package:number_trivia/core/error/failure.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia extends Usecase<NumberTrivia, int> {
  final NumberTriviaRepository numberTriviaRepository;

  GetConcreteNumberTrivia(this.numberTriviaRepository);
  @override
  Future<NumberTrivia> call(dynamic number) async {
    // dynamic au lieu de int fait expres
    if (number is! int || number < 0) throw FormatFailure();
    return await numberTriviaRepository.getConcreteNumberTrivia(number);
  }
}
