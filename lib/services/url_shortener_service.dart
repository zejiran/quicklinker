import 'dart:convert';

import 'package:http/http.dart' as http;

// TODO: replace this with a functional shortener service
class UrlShortenerService {
  static const String _baseUrl =
      'https://url-shortener-server.onrender.com/api/alias';

  // Warm up the server to avoid cold starts, useful for serverless platforms like Render
  static Future<void> warmUpServer() async {
    await http.get(Uri.parse('$_baseUrl/random-id'));
  }

  Future<String> shortenUrl(String url) async {
    var response = await http.post(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'url': url}),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['_links']['short'];
    } else {
      throw Exception('Failed to shorten URL');
    }
  }
}
