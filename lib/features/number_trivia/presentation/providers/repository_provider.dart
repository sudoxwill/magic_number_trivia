import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_trivia/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia/features/number_trivia/presentation/providers/data_sources_providers.dart';
import 'package:number_trivia/features/number_trivia/presentation/providers/network_providers.dart';

final numberTriviaRepositoryProvider = Provider<NumberTriviaRepository>((ref) {
  return NumberTriviaRepositoryImpl(
    networkInfo: ref.watch(networkInfoProvider),
    numberTriviaRemoteDataSource: ref.watch(
      numberTriviaRemoteDataSourceProvider,
    ),
    numberTriviaLocalDataSource: ref.watch(numberTriviaLocalDataSourceProvider),
  );
});
