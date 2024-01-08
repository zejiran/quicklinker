import 'package:flutter_test/flutter_test.dart';
import 'package:quicklinker/utils/url_utils.dart';

void main() {
  group('URL Utils', () {
    test('ensureHttpPrefix adds https if missing', () {
      expect(ensureHttpPrefix('example.com'), 'https://example.com');
      expect(ensureHttpPrefix('http://example.com'), 'http://example.com');
      expect(ensureHttpPrefix('https://example.com'), 'https://example.com');
      expect(ensureHttpPrefix(''), 'https://');
    });

    test('isValidUrl checks if URL is valid and has http/https', () {
      expect(isValidUrl('https://example.com'), isTrue);
      expect(isValidUrl('http://example.com'), isTrue);
      expect(isValidUrl(''), isFalse);
    });
  });
}
