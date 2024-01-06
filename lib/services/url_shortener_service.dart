import 'package:http/http.dart' as http;
import 'dart:convert';

class UrlShortenerService {
  Future<String> shortenUrl(String url) async {
    var response = await http.post(
      Uri.parse('https://url-shortener-server.onrender.com/api/alias'),
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
