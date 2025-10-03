import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class RadioProvider extends ChangeNotifier {
  String? currentPlayingUrl;
  AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  double currentVolume = 2.0;

  /// play
  Future<void> play(String url) async {
    if (currentPlayingUrl == url) {
      isPlaying ? await player.pause() : await player.resume();
      isPlaying = !isPlaying;
    } else {
      await player.stop();
      currentPlayingUrl = url;
      await player.play(UrlSource(url), volume: currentVolume);
      isPlaying = true;
    }
    notifyListeners();
  }

  /// stop
  Future<void> stop() async {
    await player.stop();
    currentPlayingUrl = null;
    isPlaying = false;
    notifyListeners();
  }

  /// volume
  Future<void> setVolume(double volume) async {
    currentVolume = volume;
    await player.setVolume(volume);
    notifyListeners();
  }
}
