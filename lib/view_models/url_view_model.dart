import 'package:flutter/material.dart';
import 'package:quicklinker/models/url_model.dart';
import 'package:quicklinker/services/database_service.dart';
import 'package:quicklinker/services/url_shortener_service.dart';

class UrlViewModel with ChangeNotifier {
  final UrlShortenerService _shortenerService = UrlShortenerService();
  final DatabaseService _databaseService = DatabaseService();
  List<UrlModel> _urls = [];

  List<UrlModel> get urls => _urls;

  UrlViewModel() {
    _loadShortenedUrls();
  }

  void _loadShortenedUrls() async {
    _urls = await _databaseService.getLinks();
    notifyListeners();
  }

  void shortenUrl(String originalUrl) async {
    var shortUrl = await _shortenerService.shortenUrl(originalUrl);
    var urlModel = UrlModel(
      originalUrl: originalUrl,
      shortUrl: shortUrl,
      timestamp: DateTime.now(),
    );
    _urls.insert(0, urlModel);
    await _databaseService.insertLink(urlModel);
    notifyListeners();
  }
}
