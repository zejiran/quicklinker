import 'package:flutter/material.dart';

class ShortenLinkButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const ShortenLinkButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      key: const Key('shortenLinkButton'),
      onPressed: onPressed,
      icon: const Icon(Icons.send),
      label: const Text('Shorten Link'),
    );
  }
}
