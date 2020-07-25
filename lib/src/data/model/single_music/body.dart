import 'package:music_fetch/src/data/model/single_music/track.dart';

class Body {
  Track track;

  Body.fromJsonMap(Map<String, dynamic> map)
      : track = Track.fromJsonMap(map["track"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['track'] = track == null ? null : track.toJson();
    return data;
  }
}
