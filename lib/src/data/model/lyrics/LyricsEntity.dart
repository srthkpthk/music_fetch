import 'package:music_fetch/src/data/model/lyrics/message.dart';

class LyricsEntity {
  Message message;

  LyricsEntity.fromJsonMap(Map<String, dynamic> map)
      : message = Message.fromJsonMap(map["message"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = message == null ? null : message.toJson();
    return data;
  }
}
