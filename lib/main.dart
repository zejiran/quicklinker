import 'package:flutter/material.dart';
import 'package:quicklinker/services/database_service.dart';
import 'package:quicklinker/theme/style.dart';
import 'package:quicklinker/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.initHive();
  runApp(const QuickLinkerApp());
}

class QuickLinkerApp extends StatelessWidget {
  const QuickLinkerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickLinker',
      theme: getAppTheme(),
      routes: Routes.getRoutes(),
      initialRoute: Routes.home,
    );
  }
}
