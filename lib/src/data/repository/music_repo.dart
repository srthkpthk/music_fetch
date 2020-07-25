import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:music_fetch/src/data/model/lyrics/LyricsEntity.dart';
import 'package:music_fetch/src/data/model/lyrics/lyrics.dart';
import 'package:music_fetch/src/data/model/music_list/MusicEntity.dart';
import 'package:music_fetch/src/data/model/single_music/SingleMusicEntity.dart';
import 'package:music_fetch/src/util/cons.dart';

class MusicRepository {
  static const String URL =
      "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=$API_KEY";

  getMusic() async {
    var res = await Dio().get(URL);
//    print(res.data);
    return MusicEntity.fromJsonMap(json.decode(res.data));
  }

  getMusicByCommonTrackID(int id) async {
    var res = await Dio().get(
        'https://api.musixmatch.com/ws/1.1/track.get?commontrack_id=$id&apikey=$API_KEY');
    return SingleMusicEntity.fromJsonMap(json.decode(res.data));
  }

  getLyricsByCommonTrackID(int id) async {
    var res = await Dio().get(
        'https://api.musixmatch.com/ws/1.1/track.lyrics.get?commontrack_id=$id&apikey=$API_KEY');
    return LyricsEntity.fromJsonMap(json.decode(res.data));
  }
}
