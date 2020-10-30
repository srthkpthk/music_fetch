import 'dart:convert';

import 'package:music_fetch/src/data/api/api.dart';
import 'package:music_fetch/src/data/model/lyrics/LyricsEntity.dart';
import 'package:music_fetch/src/data/model/music_list/MusicEntity.dart';
import 'package:music_fetch/src/data/model/single_music/SingleMusicEntity.dart';

class MusicRepository {
  getMusic() async {
    var res = await MusicFetchApi.dio.get('chart.tracks.get');
    return MusicEntity.fromJsonMap(json.decode(res.data));
  }

  getMusicByTrackID(int id) async {
    var res = await MusicFetchApi.dio.get(
      'track.get',
      queryParameters: {
        'track_id': id,
      },
    );
    return SingleMusicEntity.fromJsonMap(json.decode(res.data));
  }

  getLyricsByTrackID(int id) async {
    var res = await MusicFetchApi.dio.get(
      'track.lyrics.get',
      queryParameters: {
        'track_id': id,
      },
    );
    return LyricsEntity.fromJsonMap(json.decode(res.data));
  }
}
