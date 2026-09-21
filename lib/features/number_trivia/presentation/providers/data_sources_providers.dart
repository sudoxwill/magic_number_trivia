import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:number_trivia/features/number_trivia/presentation/providers/network_providers.dart';

final numberTriviaLocalDataSourceProvider =
    Provider<NumberTriviaLocalDataSource>((ref) {
      return NumberTriviaLocalDataSourceImpl(ref.watch(hiveProvider));
    });

final numberTriviaRemoteDataSourceProvider =
    Provider<NumberTriviaRemoteDataSource>((ref) {
      return NumberTriviaRemoteDataSourceImpl(
        networkInfo: ref.watch(networkInfoProvider),
        numberTriviaLocalDataSource: ref.watch(
          numberTriviaLocalDataSourceProvider,
        ),
        dio: ref.watch(dioProvider),
      );
    });
