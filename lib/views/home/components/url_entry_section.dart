import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicklinker/global/components/error_snack_bar.dart';
import 'package:quicklinker/global/components/shorten_link_button.dart';
import 'package:quicklinker/global/components/url_input_field.dart';
import 'package:quicklinker/utils/url_utils.dart';
import 'package:quicklinker/view_models/url_view_model.dart';

class UrlEntrySection extends StatelessWidget {
  const UrlEntrySection({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController urlController = TextEditingController();

    return Consumer<UrlViewModel>(
      builder: (context, viewModel, child) {
        void onShortenPressed() {
          if (isValidUrl(urlController.text)) {
            String url = urlController.text.trim();
            url = ensureHttpPrefix(url);
            viewModel.shortenUrl(url);
          } else {
            ErrorSnackBar.showError(
              context,
              'Please enter a valid URL.',
            );
          }
        }

        return Column(
          children: <Widget>[
            UrlInputField(
              controller: urlController,
              enabled: viewModel.isConnected,
            ),
            const SizedBox(height: 15),
            ShortenLinkButton(
              onPressed:
                  viewModel.isConnected ? () => onShortenPressed() : null,
            ),
            const SizedBox(height: 30),
          ],
        );
      },
    );
  }
}
