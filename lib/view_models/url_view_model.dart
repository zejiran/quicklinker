import 'package:flutter/material.dart';
import 'package:quicklinker/models/url/url_model.dart';
import 'package:quicklinker/services/audio_player_service.dart';
import 'package:quicklinker/services/connectivity_service.dart';
import 'package:quicklinker/services/database_service.dart';
import 'package:quicklinker/services/url_shortener_service.dart';
import 'package:quicklinker/theme/style.dart';
import 'package:quicklinker/utils/snack_bar_util.dart';

class UrlViewModel with ChangeNotifier {
  final UrlShortenerService _shortenerService = UrlShortenerService();
  final DatabaseService _databaseService = DatabaseService();
  final ConnectivityService _connectivityService = ConnectivityService();
  late BuildContext context;
  List<UrlModel> _urls = [];
  bool _isLoading = false;
  bool _isConnected = false;

  List<UrlModel> get urls => _urls;

  bool get isLoading => _isLoading;

  bool get isConnected => _isConnected;

  UrlViewModel(this.context) {
    _loadShortenedUrls();
    _initializeConnectivity();
  }

  @override
  void dispose() {
    _connectivityService.dispose();
    super.dispose();
  }

  Future<void> _initializeConnectivity() async {
    _isConnected = await _connectivityService.checkConnectivity();
    _connectivityService.onConnectivityChanged.listen((bool isConnected) {
      _isConnected = isConnected;
      _showConnectivityMessage();
      notifyListeners();
    });
  }

  void _showConnectivityMessage() {
    SnackBarUtil.showSnackBar(
      context,
      _isConnected
          ? 'Internet has returned, continue shortening new links.'
          : 'No internet connection available, but you can continue visualizing your previously shortened URLs.',
      backgroundColor: lightColorScheme.secondaryContainer,
    );
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
