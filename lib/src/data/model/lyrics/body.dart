import 'package:music_fetch/src/data/model/lyrics/lyrics.dart';

class Body {
  Lyrics lyrics;

  Body.fromJsonMap(Map<String, dynamic> map)
      : lyrics = Lyrics.fromJsonMap(map["lyrics"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lyrics'] = lyrics == null ? null : lyrics.toJson();
    return data;
  }
}
