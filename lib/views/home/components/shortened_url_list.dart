import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quicklinker/services/audio_player_service.dart';
import 'package:quicklinker/utils/snack_bar_util.dart';
import 'package:quicklinker/view_models/url_view_model.dart';

class ShortenedUrlList extends StatelessWidget {
  const ShortenedUrlList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UrlViewModel>(context);

    return ListView.separated(
      itemCount: viewModel.urls.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final url = viewModel.urls[index];
        const maxTitleLength = 60;

        String shortenTitle(String title) {
          if (title.length > maxTitleLength) {
            return '${title.substring(0, maxTitleLength)}...';
          }
          return title;
        }

        return Dismissible(
          key: Key(url.shortUrl),
          onDismissed: (direction) async {
            AudioPlayerService.play('sounds/delete.m4a');
            viewModel.deleteUrl(url);
          },
          background: buildDismissBackground(),
          secondaryBackground: buildDismissBackground(isSecondary: true),
          child: ListTile(
            leading: const Icon(Icons.link, size: 25),
            title: Text(shortenTitle(url.originalUrl)),
            subtitle: Text(url.shortUrl),
            onTap: () {
              Clipboard.setData(ClipboardData(text: url.shortUrl));
              AudioPlayerService.play('sounds/simple_celebration_02.wav');
              SnackBarUtil.showSnackBar(
                context,
                'Copied to clipboard: ${url.shortUrl}',
              );
            },
          ),
        );
      },
    );
  }

  Widget buildDismissBackground({bool isSecondary = false}) {
    return Container(
      color: Colors.red,
      child: Row(
        mainAxisAlignment:
            isSecondary ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSecondary) ...[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(Icons.delete, color: Colors.white),
            ),
          ],
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Delete', style: TextStyle(color: Colors.white)),
          ),
          if (isSecondary) ...[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(Icons.delete, color: Colors.white),
            ),
          ],
        ],
      ),
    );
  }
}
