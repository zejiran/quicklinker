import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';
import 'package:quicklinker/global/components/shorten_link_button.dart';
import 'package:quicklinker/global/components/url_input_field.dart';
import 'package:quicklinker/view_models/url_view_model.dart';
import 'package:quicklinker/views/home/components/url_entry_section.dart';

import 'url_entry_section_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UrlViewModel>()])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('UrlEntrySection Tests', () {
    late MockUrlViewModel mockUrlViewModel;

    setUp(() {
      mockUrlViewModel = MockUrlViewModel();
    });

    testWidgets('renders input field and shorten button correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider<UrlViewModel>(
          create: (_) => mockUrlViewModel,
          child: const Scaffold(body: UrlEntrySection()),
        ),
      ));

      expect(find.byType(UrlInputField), findsOneWidget);
      expect(find.byType(ShortenLinkButton), findsOneWidget);
    });
  });
}
