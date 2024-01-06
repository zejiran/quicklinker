import 'package:flutter/material.dart';
import '../models/url_model.dart';
import '../services/url_shortener_service.dart';
import '../services/database_service.dart';

class UrlViewModel with ChangeNotifier {
  final UrlShortenerService _shortenerService = UrlShortenerService();
  final DatabaseService _databaseService = DatabaseService();

  final List<UrlModel> _urls = [];

  List<UrlModel> get urls => _urls;

  void shortenUrl(String originalUrl) async {
    var shortUrl = await _shortenerService.shortenUrl(originalUrl);
    var urlModel = UrlModel(originalUrl: originalUrl, shortUrl: shortUrl);
    _urls.add(urlModel);
    await _databaseService.insertLink(urlModel);
    notifyListeners();
  }
}
