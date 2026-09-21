import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_trivia/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia/features/number_trivia/presentation/providers/data_sources_providers.dart';

final numberTriviaRepositoryProvider = Provider<NumberTriviaRepository>((ref) {
  return NumberTriviaRepositoryImpl(
    numberTriviaRemoteDataSource: ref.watch(
      numberTriviaRemoteDataSourceProvider,
    ),
  );
});
