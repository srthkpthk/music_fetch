import 'package:music_fetch/src/data/model/single_music/message.dart';

class SingleMusicEntity {
  Message message;

  SingleMusicEntity.fromJsonMap(Map<String, dynamic> map)
      : message = Message.fromJsonMap(map["message"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = message == null ? null : message.toJson();
    return data;
  }
}
