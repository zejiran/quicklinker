import 'package:hive/hive.dart';

part 'url_model.g.dart';

@HiveType(typeId: 0)
class UrlModel extends HiveObject {
  @HiveField(0)
  final String originalUrl;

  @HiveField(1)
  final String shortUrl;

  @HiveField(2)
  final DateTime timestamp;

  UrlModel({
    required this.originalUrl,
    required this.shortUrl,
    required this.timestamp,
  });
}
