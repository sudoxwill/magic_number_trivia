import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_trivia/features/history/presentation/providers/history_provider.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:number_trivia/features/number_trivia/presentation/providers/usecases_providers.dart';

class NumberTriviaNotifier extends AsyncNotifier<NumberTrivia?> {
  @override
  FutureOr<NumberTrivia?> build() async => null;

  Future<void> showCachedTrivia(NumberTrivia numberTrivia) async {
    state = AsyncValue.data(numberTrivia);
  }

  Future<void> getConcreteNumberTrivia(dynamic number) async {
    final usecase = ref.read(getConcreteNumberTriviaProvider);
    state = AsyncValue.loading();
    final result = await usecase(number);
    result.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (numberTrivia) => state = AsyncValue.data(numberTrivia),
    );
    ref.invalidate(historyProvider);
  }

  Future<void> getRandomNumberTrivia() async {
    final usecase = ref.read(getRandomNumberTriviaProvider);
    state = AsyncValue.loading();
    final result = await usecase(NoParam());
    result.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (numberTrivia) => state = AsyncValue.data(numberTrivia),
    );
    ref.invalidate(historyProvider);
  }
}

final numberTriviaProvider =
    AsyncNotifierProvider<NumberTriviaNotifier, NumberTrivia?>(
      NumberTriviaNotifier.new,
    );
