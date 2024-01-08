import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quicklinker/global/components/shimmer_loading_list.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  group('ShimmerLoadingList Tests', () {
    testWidgets('builds correct number of items', (WidgetTester tester) async {
      const testItemCount = 5;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShimmerLoadingList(itemCount: testItemCount),
          ),
        ),
      );

      expect(find.byType(Shimmer), findsOneWidget);
      expect(find.byType(PlaceholderLines), findsNWidgets(testItemCount));
    });

    testWidgets('PlaceholderLines have correct styling',
        (WidgetTester tester) async {
      const testItemCount = 5;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShimmerLoadingList(itemCount: testItemCount),
          ),
        ),
      );

      final placeholderLine =
          tester.widgetList(find.byType(Container)).first as Container;
      expect(placeholderLine.color, Colors.black);
    });
  });
}
