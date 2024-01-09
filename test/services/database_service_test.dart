import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quicklinker/models/url/url_model.dart';
import 'package:quicklinker/services/database_service.dart';

void main() {
  group('DatabaseService Tests', () {
    final databaseService = DatabaseService();

    setUpAll(() async {
      Hive.init('${Directory.current.path}/test/hive_testing_dir');
      Hive.registerAdapter(UrlModelAdapter());
      await Hive.openBox<UrlModel>('shortened_urls');
    });

    test('insertLink adds a UrlModel to the box', () async {
      final urlModel = UrlModel(
        originalUrl: 'https://example.com',
        shortUrl: 'https://short.url',
        timestamp: DateTime.now(),
      );
      await databaseService.insertLink(urlModel);

      final box = Hive.box<UrlModel>('shortened_urls');
      expect(box.values, contains(urlModel));
    });

    test('getLinks retrieves a list of UrlModels', () async {
      final urlModel = UrlModel(
        originalUrl: 'https://example.com',
        shortUrl: 'https://short.url',
        timestamp: DateTime.now(),
      );
      await databaseService.insertLink(urlModel);

      final urls = await databaseService.getLinks();
      expect(urls.isNotEmpty, isTrue);
    });

    test('deleteLink removes a UrlModel from the box', () async {
      final urlModel = UrlModel(
        originalUrl: 'https://example.com',
        shortUrl: 'https://short.url',
        timestamp: DateTime.now(),
      );
      await databaseService.insertLink(urlModel);

      await databaseService.deleteLink(urlModel);
      final box = Hive.box<UrlModel>('shortened_urls');
      expect(box.values, isNot(contains(urlModel)));
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
