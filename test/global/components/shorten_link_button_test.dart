import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quicklinker/global/components/shorten_link_button.dart';

void main() {
  group('ShortenLinkButton Tests', () {
    testWidgets('displays the correct icon and label',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ShortenLinkButton(onPressed: () {}),
          ),
        ),
      );

      expect(find.byKey(const Key('shortenLinkButton')), findsOneWidget);
      expect(find.byIcon(Icons.send), findsOneWidget);
      expect(find.text('Shorten Link'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (WidgetTester tester) async {
      bool wasPressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ShortenLinkButton(
              onPressed: () {
                wasPressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byKey(const Key('shortenLinkButton')));
      await tester.pumpAndSettle();

      expect(wasPressed, isTrue);
    });

    testWidgets('is disabled when onPressed is null',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShortenLinkButton(onPressed: null),
          ),
        ),
      );

      expect(
        tester
            .widget<ElevatedButton>(
              find.byKey(
                const Key('shortenLinkButton'),
              ),
            )
            .onPressed,
        isNull,
      );
    });
  });
}
