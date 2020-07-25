import 'package:music_fetch/src/data/model/single_music/header.dart';
import 'package:music_fetch/src/data/model/single_music/body.dart';

class Message {
  Header header;
  Body body;

  Message.fromJsonMap(Map<String, dynamic> map)
      : header = Header.fromJsonMap(map["header"]),
        body = Body.fromJsonMap(map["body"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = header == null ? null : header.toJson();
    data['body'] = body == null ? null : body.toJson();
    return data;
  }
}
