class UrlModel {
  final String originalUrl;
  final String shortUrl;
  final DateTime timestamp;

  UrlModel({
    required this.originalUrl,
    required this.shortUrl,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'originalUrl': originalUrl,
      'shortUrl': shortUrl,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  static UrlModel fromMap(Map<String, dynamic> map) {
    return UrlModel(
      originalUrl: map['originalUrl'],
      shortUrl: map['shortUrl'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
