import 'package:music_fetch/src/data/model/music_list/track_list.dart';

class Body {
  List<Track_list> track_list;

  Body.fromJsonMap(Map<String, dynamic> map)
      : track_list = List<Track_list>.from(
            map["track_list"].map((it) => Track_list.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['track_list'] = track_list != null
        ? this.track_list.map((v) => v.toJson()).toList()
        : null;
    return data;
  }
}
