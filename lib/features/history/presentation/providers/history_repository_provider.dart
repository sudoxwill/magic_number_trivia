import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_trivia/features/history/data/repositories/history_repository_impl.dart';
import 'package:number_trivia/features/history/domain/repositories/history_repository.dart';
import 'package:number_trivia/features/number_trivia/presentation/providers/data_sources_providers.dart';

final historyRepositoryProvider = Provider<HistoryRepository>((ref) {
  return HistoryRepositoryImpl(ref.watch(numberTriviaLocalDataSourceProvider));
});
