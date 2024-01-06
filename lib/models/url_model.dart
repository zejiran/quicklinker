class UrlModel {
  final String originalUrl;
  final String shortUrl;

  UrlModel({required this.originalUrl, required this.shortUrl});

  Map<String, dynamic> toMap() {
    return {'originalUrl': originalUrl, 'shortUrl': shortUrl};
  }

  static UrlModel fromMap(Map<String, dynamic> map) {
    return UrlModel(
      originalUrl: map['originalUrl'],
      shortUrl: map['shortUrl'],
    );
  }
}
