import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicklinker/global/components/shimmer_loading_list.dart';
import 'package:quicklinker/view_models/url_view_model.dart';

import 'components/quicklinker_app_bar.dart';
import 'components/shortened_url_list.dart';
import 'components/url_entry_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UrlViewModel(context),
      child: Consumer<UrlViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: const QuickLinkerAppBar(),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const UrlEntrySection(),
                  const Text(
                    'Recently Shortened URLs',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                        ? const ShimmerLoadingList()
                        : const ShortenedUrlList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
