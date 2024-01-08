import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:quicklinker/global/components/shimmer_loading_list.dart';
import 'package:quicklinker/models/url/url_model.dart';
import 'package:quicklinker/view_models/url_view_model.dart';
import 'package:quicklinker/views/home/components/shortened_url_list.dart';
import 'package:quicklinker/views/home/home_screen.dart';

import 'home_screen_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UrlViewModel>()])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('HomeScreen Tests', () {
    late MockUrlViewModel mockUrlViewModel;

    setUpAll(() async {
      Hive.init('${Directory.current.path}/test/hive_testing_dir');
      Hive.registerAdapter(UrlModelAdapter());
      await Hive.openBox<UrlModel>('shortened_urls');
    });

    setUp(() {
      mockUrlViewModel = MockUrlViewModel();
    });

    testWidgets('renders correctly with loading state',
        (WidgetTester tester) async {
      when(mockUrlViewModel.isLoading).thenReturn(true);

      await tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider<UrlViewModel>(
          create: (_) => mockUrlViewModel,
          child: const HomeScreen(),
        ),
      ));

      expect(find.byType(ShimmerLoadingList), findsOneWidget);
      expect(find.byType(ShortenedUrlList), findsNothing);
    });

    tearDownAll(() async {
      await Hive.close();
      final directory =
          Directory('${Directory.current.path}/test/hive_testing_dir');
      if (await directory.exists()) {
        await directory.delete(recursive: true);
      }
    });
  });
}
