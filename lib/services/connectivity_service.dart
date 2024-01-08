import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._internal();
  final Connectivity _connectivity = Connectivity();
  final StreamController<bool> _connectivityController =
      StreamController<bool>.broadcast();
  StreamSubscription<ConnectivityResult>? _subscription;

  factory ConnectivityService() {
    return _instance;
  }

  ConnectivityService._internal() {
    resumeUpdates();
  }

  void resumeUpdates() {
    _subscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      bool isConnected = result != ConnectivityResult.none;
      _connectivityController.add(isConnected);
    });
  }

  void pauseUpdates() {
    _subscription?.cancel();
  }

  Stream<bool> get onConnectivityChanged => _connectivityController.stream;

  Future<bool> checkConnectivity() async {
    var currentStatus = await _connectivity.checkConnectivity();
    return currentStatus != ConnectivityResult.none;
  }

  void dispose() {
    _connectivityController.close();
    _subscription?.cancel();
  }
}
