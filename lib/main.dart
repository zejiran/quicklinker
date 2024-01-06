import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_models/url_view_model.dart';
import 'views/home_screen.dart';

void main() {
  runApp(const QuickLinkerApp());
}

class QuickLinkerApp extends StatelessWidget {
  const QuickLinkerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UrlViewModel(),
      child: MaterialApp(
        title: 'Link Shortener',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeScreen(),
      ),
    );
  }
}
