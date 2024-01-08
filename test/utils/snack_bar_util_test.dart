import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quicklinker/utils/snack_bar_util.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SnackBarUtil Tests', () {
    testWidgets(
        'showSnackBar displays a SnackBar with correct message and default color',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: () {
                  SnackBarUtil.showSnackBar(context, 'Test Message');
                },
                child: const Text('Show SnackBar'),
              );
            },
          ),
        ),
      ));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Test Message'), findsOneWidget);

      final SnackBar snackBar = tester.firstWidget(find.byType(SnackBar));
      expect(snackBar.backgroundColor,
          Theme.of(tester.element(find.byType(Scaffold))).primaryColor);
    });

    testWidgets(
        'showSnackBar displays a SnackBar with specified background color',
        (WidgetTester tester) async {
      const Color customColor = Colors.red;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    SnackBarUtil.showSnackBar(context, 'Test Message',
                        backgroundColor: customColor);
                  },
                  child: const Text('Show SnackBar'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      final SnackBar snackBar = tester.firstWidget(find.byType(SnackBar));
      expect(snackBar.backgroundColor, customColor);
    });
  });
}
