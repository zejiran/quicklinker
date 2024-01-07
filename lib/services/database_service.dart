import 'package:hive_flutter/hive_flutter.dart';
import 'package:quicklinker/models/url/url_model.dart';

class DatabaseService {
  static const String _boxName = 'shortened_urls';

  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UrlModelAdapter());
    await Hive.openBox<UrlModel>(_boxName);
  }

  Box<UrlModel> get _box {
    return Hive.box<UrlModel>(_boxName);
  }

  Future<void> insertLink(UrlModel url) async {
    await _box.put(url.shortUrl, url);
  }

  Future<List<UrlModel>> getLinks() async {
    var links = _box.values.toList();
    links.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return links;
  }

  Future<void> deleteLink(UrlModel url) async {
    await _box.delete(url.shortUrl);
  }

  Future<void> closeBox() async {
    await _box.close();
  }
}
