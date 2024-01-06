import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quicklinker/models/url_model.dart';

class UrlList extends StatelessWidget {
  final List<UrlModel> urls;

  const UrlList({super.key, required this.urls});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: urls.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        UrlModel url = urls[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            leading: const Icon(Icons.link, size: 25),
            title: Text(url.originalUrl),
            subtitle: Text(url.shortUrl),
            onTap: () {
              Clipboard.setData(ClipboardData(text: url.shortUrl));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Copied to clipboard: ${url.shortUrl}'),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
