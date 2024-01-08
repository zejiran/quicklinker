import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quicklinker/global/components/url_input_field.dart';

void main() {
  group('UrlInputField Tests', () {
    testWidgets('renders a text field with the correct label', (WidgetTester tester) async {
      TextEditingController controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UrlInputField(controller: controller),
          ),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Enter URL'), findsOneWidget);
    });

    testWidgets('is enabled by default and accepts input', (WidgetTester tester) async {
      TextEditingController controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UrlInputField(controller: controller),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'https://example.com');
      expect(controller.text, 'https://example.com');
    });

    testWidgets('can be disabled', (WidgetTester tester) async {
      TextEditingController controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UrlInputField(controller: controller, enabled: false),
          ),
        ),
      );

      TextField textField = tester.widget(find.byType(TextField));
      expect(textField.enabled, isFalse);
    });
  });
}
