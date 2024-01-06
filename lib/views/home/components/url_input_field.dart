import 'package:flutter/material.dart';

class UrlInputField extends StatelessWidget {
  final TextEditingController controller;

  const UrlInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Enter URL',
        border: OutlineInputBorder(),
      ),
    );
  }
}
