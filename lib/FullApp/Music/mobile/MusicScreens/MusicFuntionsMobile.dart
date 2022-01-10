import 'package:assets_audio_player/assets_audio_player.dart';

final AssetsAudioPlayer player = AssetsAudioPlayer.newPlayer();

final Playlist playlist = Playlist(audios: [
  Audio(
    "assets/rajneeti-flute-24.mp3",
    metas: Metas(title: 'rajneeti-flute-24'),
  ),
  Audio(
    "assets/rajneeti-flute-24.mp3",
    metas: Metas(title: 'rajneeti-flute-2222'),
  ),
]);
