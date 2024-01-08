import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quicklinker/views/home/components/quicklinker_app_bar.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('QuickLinkerAppBar Tests', () {
    testWidgets('renders with correct texts', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: QuickLinkerAppBar(),
          ),
        ),
      );

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('QuickLinker'), findsOneWidget);
      expect(
        find.text('Shorten your links quickly and easily'),
        findsOneWidget,
      );
    });

    testWidgets('has the correct preferred size', (WidgetTester tester) async {
      const appBar = QuickLinkerAppBar();

      expect(appBar.preferredSize, const Size.fromHeight(kToolbarHeight));
    });
  });
}
