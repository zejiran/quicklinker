import 'package:flutter/material.dart';

class SnackBarUtil {
  static void showSnackBar(
    BuildContext context,
    String message, {
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          duration: const Duration(seconds: 6),
        ),
      );
  }
}
