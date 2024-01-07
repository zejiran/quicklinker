bool isValidUrl(String url) {
  final Uri uri = Uri.tryParse(url) ?? Uri();
  return uri.hasAuthority;
}