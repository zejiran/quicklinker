import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quicklinker/services/audio_player_service.dart';
import 'package:quicklinker/view_models/url_view_model.dart';

class UrlList extends StatelessWidget {
  const UrlList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UrlViewModel>(context);

    return ListView.separated(
      itemCount: viewModel.urls.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final url = viewModel.urls[index];

        return Dismissible(
          key: Key(url.shortUrl),
          onDismissed: (direction) async {
            AudioPlayerService.play('sounds/delete.m4a');
            viewModel.deleteUrl(url);
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          child: ListTile(
            leading: const Icon(Icons.link, size: 25),
            title: Text(url.originalUrl),
            subtitle: Text(url.shortUrl),
            onTap: () {
              Clipboard.setData(ClipboardData(text: url.shortUrl));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Copied to clipboard: ${url.shortUrl}')),
              );
            },
          ),
        );
      },
    );
  }
}
