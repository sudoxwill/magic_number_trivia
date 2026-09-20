import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/message_display.dart';
import '../widgets/trivia_controls.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              onSearch: (value) {},
              onRandom: () {},
            ),
            const SizedBox(height: 24),
            const Expanded(
              child: MessageDisplay(
                message: 'Entrez un nombre pour commencer',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
