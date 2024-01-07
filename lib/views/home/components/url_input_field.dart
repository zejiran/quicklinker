import 'package:flutter/material.dart';

class UrlInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool enabled;

  const UrlInputField({
    super.key,
    required this.controller,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      decoration: const InputDecoration(
        labelText: 'Enter URL',
        border: OutlineInputBorder(),
      ),
    );
  }
}
