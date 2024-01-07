import 'package:flutter/material.dart';
import 'package:quicklinker/services/audio_player_service.dart';
import 'package:quicklinker/utils/snack_bar_util.dart';

class ErrorSnackBar {
  static void showError(BuildContext context, String message) {
    AudioPlayerService.play('sounds/alert_error.wav');
    SnackBarUtil.showSnackBar(context, message, backgroundColor: Colors.red);
  }
}
