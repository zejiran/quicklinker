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
    return ChangeNotifierProvider(
        create: (_) => UrlViewModel(context),
        child: Consumer<UrlViewModel>(builder: (context, viewModel, child) {
          final TextEditingController urlController = TextEditingController();

          return Scaffold(
            appBar: AppBar(
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('QuickLinker'),
                  Text(
                    'Shorten your links quickly and easily',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  UrlInputField(
                    controller: urlController,
                    enabled: viewModel.isConnected,
                  ),
                  const SizedBox(height: 15),
                  ShortenButton(
                    onPressed: viewModel.isConnected
                        ? () {
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
                        : null,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Recently Shortened URLs',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Tap to copy, swipe to delete',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: viewModel.isLoading
                        ? const ShimmerLoading()
                        : const UrlList(),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
