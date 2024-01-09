import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:quicklinker/models/url/url_model.dart';
import 'package:quicklinker/view_models/url_view_model.dart';
import 'package:quicklinker/views/home/components/shortened_url_list.dart';

import 'shortened_url_list_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UrlViewModel>()])
void main() {
  group('ShortenedUrlList Tests', () {
    testWidgets('displays a list of shortened URLs',
        (WidgetTester tester) async {
      final mockViewModel = MockUrlViewModel();
      when(mockViewModel.urls).thenReturn([
        UrlModel(
          originalUrl: 'https://example.com',
          shortUrl: 'https://short.url',
          timestamp: DateTime.now(),
        ),
      ]);

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<UrlViewModel>(
            create: (_) => mockViewModel,
            child: const Scaffold(
              body: ShortenedUrlList(),
            ),
          ),
        ),
      );

      expect(find.byType(ListTile), findsNWidgets(mockViewModel.urls.length));
    });
  });
}
