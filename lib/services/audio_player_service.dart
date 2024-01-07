import 'package:audioplayers/audioplayers.dart';

class AudioPlayerService {
  static final AudioPlayer _audioPlayer = AudioPlayer();

  static Future<void> play(String assetPath) async {
    await _audioPlayer.play(AssetSource(assetPath));
  }
}
