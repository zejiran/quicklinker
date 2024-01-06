import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quicklinker/models/url_model.dart';
import 'package:quicklinker/view_models/url_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UrlViewModel>(context);
    final TextEditingController urlController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Link Shortener')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: urlController,
              decoration: const InputDecoration(
                labelText: 'Enter URL',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (urlController.text.isNotEmpty) {
                  viewModel.shortenUrl(urlController.text);
                }
              },
              child: const Text('Shorten Link'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Recently Shortened URLs',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: viewModel.urls.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  UrlModel url = viewModel.urls[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.link, size: 30),
                      title: Text(url.originalUrl),
                      subtitle: Text(url.shortUrl),
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: url.shortUrl));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Copied to clipboard: ${url.shortUrl}'),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
