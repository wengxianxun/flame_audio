import 'package:audioplayers/audioplayers.dart';

import 'bgm.dart';

/// This utility class holds static references to some global audio objects.
///
/// You can use as a helper to very simply play a sound or a background music.
/// Alternatively you can create your own instances and control them yourself.
class FlameAudio {
  /// Access a shared instance of the [AudioCache] class.
  static AudioCache audioCache = AudioCache(prefix: 'assets/audio/');

  /// Plays a single run of the given [file]
  static Future<AudioPlayer> play(String file, {volume = 1.0}) {
    return audioCache.play(file, volume: volume, mode: PlayerMode.LOW_LATENCY);
  }

  /// Plays, and keep looping the given [file]
  static Future<AudioPlayer> loop(String file, {volume = 1.0}) {
    return audioCache.loop(file, volume: volume, mode: PlayerMode.LOW_LATENCY);
  }

  /// Plays a single run of the given file [file]
  /// This method supports long audio files
  static Future<AudioPlayer> playLongAudio(String file, {volume = 1.0}) {
    return audioCache.play(file, volume: volume);
  }

  /// Plays, and keep looping the given [file]
  /// This method supports long audio files
  ///
  /// NOTE: Length audio files on Android have an audio gap between loop
  /// iterations, this happens due to limitations on Android's native media
  /// player features, if you need a gapless loop, prefer the loop method
  static Future<AudioPlayer> loopLongAudio(String file, {volume = 1.0}) {
    return audioCache.loop(file, volume: volume);
  }

  /// Access a shared instance of the [Bgm] class.
  ///
  /// This will use the same global audio cache from [FlameAudio].
  static Bgm _bgm;
  static Bgm get bgm => _bgm ??= Bgm(audioCache: audioCache);
}
