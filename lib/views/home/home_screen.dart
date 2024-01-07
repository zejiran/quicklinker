import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicklinker/utils/url_utils.dart';
import 'package:quicklinker/view_models/url_view_model.dart';

import 'components/error_snack_bar.dart';
import 'components/shimmer_loading.dart';
import 'components/shorten_button.dart';
import 'components/url_input_field.dart';
import 'components/url_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UrlViewModel>(context);
    final TextEditingController urlController = TextEditingController();

    final baseColor = Colors.grey[300]!;
    final highlightColor = Colors.grey[100]!;

    return Scaffold(
      appBar: AppBar(title: const Text('Link Shortener')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            UrlInputField(controller: urlController),
            const SizedBox(height: 10),
            ShortenButton(
              onPressed: () {
                if (isValidUrl(urlController.text)) {
                  viewModel.shortenUrl(urlController.text);
                } else {
                  ErrorSnackBar.showError(context, 'Please enter a valid URL.');
                }
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Recently Shortened URLs',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: viewModel.isLoading
                  ? ShimmerLoading(
                      baseColor: baseColor,
                      highlightColor: highlightColor,
                    )
                  : const UrlList(),
            ),
          ],
        ),
      ),
    );
  }
}
