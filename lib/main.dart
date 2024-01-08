import 'package:flutter/material.dart';
import 'package:quicklinker/services/connectivity_service.dart';
import 'package:quicklinker/services/database_service.dart';
import 'package:quicklinker/services/url_shortener_service.dart';
import 'package:quicklinker/theme/style.dart';
import 'package:quicklinker/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.initHive();
  UrlShortenerService.warmUpServer();
  runApp(const QuickLinkerApp());
}

class QuickLinkerApp extends StatefulWidget {
  const QuickLinkerApp({super.key});

  @override
  State<QuickLinkerApp> createState() => _QuickLinkerAppState();
}

class _QuickLinkerAppState extends State<QuickLinkerApp>
    with WidgetsBindingObserver {
  final ConnectivityService _connectivityService = ConnectivityService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _connectivityService.resumeUpdates();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _connectivityService.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.paused:
        _connectivityService.pauseUpdates();
        break;
      case AppLifecycleState.resumed:
        _connectivityService.resumeUpdates();
        break;
      default:
        break;
    }
  }

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
