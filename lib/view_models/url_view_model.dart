import 'package:flutter/material.dart';
import 'package:quicklinker/models/url_model.dart';
import 'package:quicklinker/services/audio_player_service.dart';
import 'package:quicklinker/services/database_service.dart';
import 'package:quicklinker/services/url_shortener_service.dart';

class UrlViewModel with ChangeNotifier {
  final UrlShortenerService _shortenerService = UrlShortenerService();
  final DatabaseService _databaseService = DatabaseService();
  List<UrlModel> _urls = [];
  bool _isLoading = false;

  List<UrlModel> get urls => _urls;
  bool get isLoading => _isLoading;

  UrlViewModel() {
    _loadShortenedUrls();
  }

  void _loadShortenedUrls() async {
    setLoading(true);
    _urls = await _databaseService.getLinks();
    setLoading(false);
  }

  void shortenUrl(String originalUrl) async {
    setLoading(true);
    var shortUrl = await _shortenerService.shortenUrl(originalUrl);
    var urlModel = UrlModel(
      originalUrl: originalUrl,
      shortUrl: shortUrl,
      timestamp: DateTime.now(),
    );
    _urls.insert(0, urlModel);
    await _databaseService.insertLink(urlModel);
    _loadShortenedUrls();
    setLoading(false);
    AudioPlayerService.play('sounds/simple_celebration_01.wav');
  }

  void deleteUrl(UrlModel url) async {
    await _databaseService.deleteLink(url);
    _loadShortenedUrls();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
