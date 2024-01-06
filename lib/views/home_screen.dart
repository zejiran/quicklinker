import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/url_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UrlViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Link Shortener')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add TextFields, Buttons, and ListViews here
          ],
        ),
      ),
    );
  }
}
