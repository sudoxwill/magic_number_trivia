import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:number_trivia/core/constants/cache_constants.dart';
import 'package:number_trivia/core/error/exception.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource {
  Future<void> cacheNumberTrivia(NumberTriviaModel numberTrivia);
  Future<List<NumberTriviaModel>> getCachedNumberTrivias();
}

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
  final Box<String> hiveBox;

  NumberTriviaLocalDataSourceImpl(this.hiveBox);

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel numberTrivia) async {
    try {
      final stringData = hiveBox.get(CacheConstants.hiveAllNumbers);
      final data = jsonDecode(stringData ?? '[]') as List<dynamic>;
      final result = data.map((e) => NumberTriviaModel.fromJson(e)).toList();
      result.add(numberTrivia);
      await hiveBox.put(
        CacheConstants.hiveAllNumbers,
        jsonEncode(result.map((e) => e.toJson()).toList()),
      );
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  Future<List<NumberTriviaModel>> getCachedNumberTrivias() async {
    try {
      final stringData = hiveBox.get(CacheConstants.hiveAllNumbers);
      final data = jsonDecode(stringData ?? '[]') as List<dynamic>;
      return data.map((e) => NumberTriviaModel.fromJson(e)).toList();
    } on CacheException {
      throw CacheException();
    }
  }
}
