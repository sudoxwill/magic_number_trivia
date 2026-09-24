import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_trivia/features/history/presentation/providers/usecases_provider.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

class HistoryNotifier extends AsyncNotifier<List<NumberTrivia>> {
  @override
  FutureOr<List<NumberTrivia>> build() async {
    final usecase = ref.read(getNumberTriviaHistoryProvider);
    final result = await usecase(NoParam());
    return result.fold(
      (failure) => throw failure,
      (numberTrivias) => numberTrivias,
    );
  }

  Future<void> getNumberTriviaHistory() async {
    final usecase = ref.read(getNumberTriviaHistoryProvider);
    state = AsyncValue.loading();
    final result = await usecase(NoParam());
    result.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (numberTrivias) => state = AsyncValue.data(numberTrivias),
    );
  }
}

final historyProvider =
    AsyncNotifierProvider<HistoryNotifier, List<NumberTrivia>>(
      HistoryNotifier.new,
    );
