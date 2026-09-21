import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_trivia/features/history/presentation/providers/usecases_provider.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

class HistoryNotifier extends AsyncNotifier<List<NumberTrivia>> {
  @override
  FutureOr<List<NumberTrivia>> build() async {
    final usecase = ref.read(getNumberTriviaHistoryProvider);
    return await usecase(NoParam());
  }

  Future<void> getNumberTriviaHistory() async {
    final usecase = ref.read(getNumberTriviaHistoryProvider);
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final result = await usecase(NoParam());
      return result;
    });
  }
}

final historyProvider =
    AsyncNotifierProvider<HistoryNotifier, List<NumberTrivia>>(
      HistoryNotifier.new,
    );
