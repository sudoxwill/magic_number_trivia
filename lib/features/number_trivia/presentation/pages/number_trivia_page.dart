import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:number_trivia/core/error/exceptions_mapper.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/presentation/providers/number_trivia_provider.dart';

import '../widgets/message_display.dart';
import '../widgets/trivia_controls.dart';

class NumberTriviaPage extends ConsumerWidget {
  final AsyncValue<NumberTrivia?>? asyncValue;
  const NumberTriviaPage({super.key, this.asyncValue});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberTriviaAsync = asyncValue != null
        ? asyncValue!
        : ref.watch(numberTriviaProvider);

    // ref.listen<AsyncValue<NumberTrivia?>>(numberTriviaProvider, (
    //   previous,
    //   next,
    // ) {
    //   if (next.hasError && !next.isLoading) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text(fromFailureToString(next.error as Failure))),
    //     );
    //   }
    // });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Trivia'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => context.pushNamed('history'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TriviaControls(
              onSearch: (value) async {
                if (value.trim().isEmpty) return;
                await ref
                    .read(numberTriviaProvider.notifier)
                    .getConcreteNumberTrivia(int.tryParse(value));
              },
              onRandom: () async {
                await ref
                    .read(numberTriviaProvider.notifier)
                    .getRandomNumberTrivia();
              },
            ),
            const SizedBox(height: 24),
            if (numberTriviaAsync.isLoading)
              Expanded(child: Center(child: CircularProgressIndicator()))
            else if (numberTriviaAsync.hasError)
              Expanded(
                child: MessageDisplay(
                  message: fromFailureToString(
                    numberTriviaAsync.error as Failure,
                  ),
                ),
              )
            else if (numberTriviaAsync.hasValue)
              Expanded(
                child: MessageDisplay(
                  message: numberTriviaAsync.value == null
                      ? 'Entrez un nombre pour commencer'
                      : numberTriviaAsync.value!.text,
                  syncColor: numberTriviaAsync.value?.isOnline == null
                      ? Colors.grey
                      : numberTriviaAsync.value?.isOnline == true
                      ? Colors.greenAccent
                      : Colors.redAccent,
                  syncIcon: numberTriviaAsync.value?.isOnline == null
                      ? Icons.sync
                      : numberTriviaAsync.value?.isOnline == true
                      ? Icons.cloud_outlined
                      : Icons.cloud_off_outlined,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
