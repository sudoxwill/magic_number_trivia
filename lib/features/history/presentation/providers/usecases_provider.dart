import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_trivia/features/history/domain/usecases/get_number_trivia_history.dart';
import 'package:number_trivia/features/history/presentation/providers/history_repository_provider.dart';

final getNumberTriviaHistoryProvider = Provider<GetNumberTriviaHistory>((ref) {
  return GetNumberTriviaHistory(ref.watch(historyRepositoryProvider));
});
