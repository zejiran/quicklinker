import 'dart:async';

import 'package:connectivity/connectivity.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  final StreamController<bool> _connectivityController =
      StreamController<bool>.broadcast();

  ConnectivityService() {
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      bool isConnected = result != ConnectivityResult.none;
      _connectivityController.add(isConnected);
    });
  }

  Stream<bool> get onConnectivityChanged => _connectivityController.stream;

  Future<bool> checkConnectivity() async {
    var currentStatus = await _connectivity.checkConnectivity();
    return currentStatus != ConnectivityResult.none;
  }

  void dispose() {
    _connectivityController.close();
  }
}
