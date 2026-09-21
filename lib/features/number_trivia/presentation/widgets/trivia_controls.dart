import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_trivia/features/number_trivia/presentation/providers/number_trivia_provider.dart';

class TriviaControls extends ConsumerStatefulWidget {
  const TriviaControls({
    super.key,
    required this.onSearch,
    required this.onRandom,
  });

  final ValueChanged<String> onSearch;
  final VoidCallback onRandom;

  @override
  ConsumerState<TriviaControls> createState() => _TriviaControlsState();
}

class _TriviaControlsState extends ConsumerState<TriviaControls> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final numberTriviaAsync = ref.watch(numberTriviaProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Entrez un nombre',
          ),
          enabled: numberTriviaAsync.isLoading ? false : true,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (numberTriviaAsync.isLoading) {
                    return;
                  } else {
                    widget.onSearch(_controller.text);
                    _controller.clear();
                  }
                },
                child: const Text('Rechercher'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton(
                onPressed: numberTriviaAsync.isLoading ? null : widget.onRandom,
                child: const Text('Nombre aléatoire'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
