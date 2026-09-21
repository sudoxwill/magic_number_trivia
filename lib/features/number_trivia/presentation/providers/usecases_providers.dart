import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:number_trivia/features/number_trivia/presentation/providers/repository_provider.dart';

final getConcreteNumberTriviaProvider = Provider<GetConcreteNumberTrivia>((
  ref,
) {
  return GetConcreteNumberTrivia(ref.watch(numberTriviaRepositoryProvider));
});

final getRandomNumberTriviaProvider = Provider<GetRandomNumberTrivia>((ref) {
  return GetRandomNumberTrivia(ref.watch(numberTriviaRepositoryProvider));
});
