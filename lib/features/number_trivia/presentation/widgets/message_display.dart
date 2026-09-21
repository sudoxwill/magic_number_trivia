import 'package:flutter/material.dart';

class MessageDisplay extends StatelessWidget {
  const MessageDisplay({
    super.key,
    required this.message,
    this.syncColor = Colors.grey,
    this.syncIcon = Icons.sync,
  });

  final String message;
  final Color syncColor;
  final IconData syncIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: syncColor.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(syncIcon, color: syncColor, size: 18),
          ),
        ),
      ],
    );
  }
}
