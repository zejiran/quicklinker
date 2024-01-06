import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicklinker/theme/style.dart';
import 'package:quicklinker/utils/routes.dart';
import 'view_models/url_view_model.dart';

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
        title: 'QuickLinker - Link Shortener',
        theme: getAppTheme(),
        routes: Routes.getRoutes(),
        initialRoute: Routes.home,
      ),
    );
  }
}
