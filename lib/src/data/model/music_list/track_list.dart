import 'package:music_fetch/src/data/model/music_list/track.dart';

class Track_list {
  Track track;

  Track_list.fromJsonMap(Map<String, dynamic> map)
      : track = Track.fromJsonMap(map["track"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['track'] = track == null ? null : track.toJson();
    return data;
  }
}
