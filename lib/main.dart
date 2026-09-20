import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:number_trivia/core/constants/cache_constants.dart';

import 'core/router/app_router.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>(CacheConstants.hiveBox);
  runApp(const ProviderScope(child: NumberTriviaApp()));
}

class NumberTriviaApp extends StatelessWidget {
  const NumberTriviaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Number Trivia',
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      routerConfig: appRouter,
    );
  }
}
