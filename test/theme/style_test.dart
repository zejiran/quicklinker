import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quicklinker/theme/style.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ThemeData Tests', () {
    test('getAppTheme returns ThemeData with correct color scheme', () {
      final ThemeData themeData = getAppTheme();

      expect(themeData.colorScheme.primary, lightColorScheme.primary);
      expect(themeData.colorScheme.secondary, lightColorScheme.secondary);
      expect(themeData.useMaterial3, true);
    });

    test('getAppTheme returns ThemeData with correct SnackBarTheme', () {
      final ThemeData themeData = getAppTheme();

      expect(themeData.snackBarTheme.backgroundColor, lightColorScheme.primary);
      expect(themeData.snackBarTheme.contentTextStyle?.color, Colors.white);
      expect(themeData.snackBarTheme.actionTextColor, Colors.white);
    });
  });
}
