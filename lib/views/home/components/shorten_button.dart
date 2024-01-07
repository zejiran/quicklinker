import 'package:flutter/material.dart';

class ShortenButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const ShortenButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.send),
      label: const Text('Shorten Link'),
    );
  }
}
