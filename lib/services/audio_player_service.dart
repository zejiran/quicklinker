import 'package:audioplayers/audioplayers.dart';

class AudioPlayerService {
  static final AudioPlayer _audioPlayer = AudioPlayer();

  static Future<void> play(String assetPath, {bool loop = false}) async {
    await _audioPlayer.setSource(AssetSource(assetPath));
    await _audioPlayer.setReleaseMode(
      loop ? ReleaseMode.loop : ReleaseMode.release,
    );
    await _audioPlayer.resume();
  }

  static Future<void> stop() async {
    await _audioPlayer.stop();
  }
}
