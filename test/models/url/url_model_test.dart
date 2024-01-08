import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:quicklinker/models/url/url_model.dart';

void main() {
  group('UrlModel Tests', () {
    setUpAll(() async {
      Hive.init('${Directory.current.path}/test/hive_testing_dir');
      Hive.registerAdapter(UrlModelAdapter());
    });

    test('should correctly instantiate UrlModel', () {
      const String testOriginalUrl = 'https://example.com';
      const String testShortUrl = 'https://short.url';
      final DateTime testTimestamp = DateTime.now();

      final urlModel = UrlModel(
        originalUrl: testOriginalUrl,
        shortUrl: testShortUrl,
        timestamp: testTimestamp,
      );

      expect(urlModel.originalUrl, equals(testOriginalUrl));
      expect(urlModel.shortUrl, equals(testShortUrl));
      expect(urlModel.timestamp, equals(testTimestamp));
    });

    tearDownAll(() async {
      await Hive.close();
    });
  });
}
