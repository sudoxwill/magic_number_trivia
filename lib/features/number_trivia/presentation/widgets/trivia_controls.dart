import 'package:flutter/material.dart';

class TriviaControls extends StatefulWidget {
  const TriviaControls({
    super.key,
    required this.onSearch,
    required this.onRandom,
  });

  final ValueChanged<String> onSearch;
  final VoidCallback onRandom;

  @override
  State<TriviaControls> createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => widget.onSearch(_controller.text),
                child: const Text('Rechercher'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton(
                onPressed: widget.onRandom,
                child: const Text('Nombre aléatoire'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
