import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_trivia/features/history/presentation/providers/history_provider.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:number_trivia/features/number_trivia/presentation/providers/usecases_providers.dart';

class NumberTriviaNotifier extends AsyncNotifier<NumberTrivia?> {
  @override
  FutureOr<NumberTrivia?> build() async {
    final usecase = ref.read(getRandomNumberTriviaProvider);
    ref.invalidate(historyProvider);
    return await usecase(NoParam());
  }

  Future<void> getConcreteNumberTrivia(dynamic number) async {
    final usecase = ref.read(getConcreteNumberTriviaProvider);
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final result = await usecase(number);
      return result;
    });
    ref.invalidate(historyProvider);
  }

  Future<void> getRandomNumberTrivia() async {
    final usecase = ref.read(getRandomNumberTriviaProvider);
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final result = await usecase(NoParam());
      return result;
    });
    ref.invalidate(historyProvider);
  }
}

final numberTriviaProvider =
    AsyncNotifierProvider<NumberTriviaNotifier, NumberTrivia?>(
      NumberTriviaNotifier.new,
    );
