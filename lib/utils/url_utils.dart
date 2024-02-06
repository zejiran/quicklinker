bool isValidUrl(String url) {
  return url.isNotEmpty && Uri.parse(ensureHttpPrefix(url)).isAbsolute;
}

String ensureHttpPrefix(String url) {
  if (!url.startsWith(RegExp(r'https?://'))) {
    url = 'https://$url';
  }
  return url;
}
