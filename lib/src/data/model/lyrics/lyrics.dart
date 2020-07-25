class Lyrics {
  int lyrics_id;
  int explicit;
  String lyrics_body;
  String script_tracking_url;
  String pixel_tracking_url;
  String lyrics_copyright;
  String updated_time;

  Lyrics.fromJsonMap(Map<String, dynamic> map)
      : lyrics_id = map["lyrics_id"],
        explicit = map["explicit"],
        lyrics_body = map["lyrics_body"],
        script_tracking_url = map["script_tracking_url"],
        pixel_tracking_url = map["pixel_tracking_url"],
        lyrics_copyright = map["lyrics_copyright"],
        updated_time = map["updated_time"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lyrics_id'] = lyrics_id;
    data['explicit'] = explicit;
    data['lyrics_body'] = lyrics_body;
    data['script_tracking_url'] = script_tracking_url;
    data['pixel_tracking_url'] = pixel_tracking_url;
    data['lyrics_copyright'] = lyrics_copyright;
    data['updated_time'] = updated_time;
    return data;
  }
}
