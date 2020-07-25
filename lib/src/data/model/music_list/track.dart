import 'package:music_fetch/src/data/model/music_list/primary_genres.dart';

class Track {
  int track_id;
  String track_name;
  List<Object> track_name_translation_list;
  int track_rating;
  int commontrack_id;
  int instrumental;
  int explicit;
  int has_lyrics;
  int has_subtitles;
  int has_richsync;
  int num_favourite;
  int album_id;
  String album_name;
  int artist_id;
  String artist_name;
  String track_share_url;
  String track_edit_url;
  int restricted;
  String updated_time;
  Primary_genres primary_genres;

  Track.fromJsonMap(Map<String, dynamic> map)
      : track_id = map["track_id"],
        track_name = map["track_name"],
        track_name_translation_list = map["track_name_translation_list"],
        track_rating = map["track_rating"],
        commontrack_id = map["commontrack_id"],
        instrumental = map["instrumental"],
        explicit = map["explicit"],
        has_lyrics = map["has_lyrics"],
        has_subtitles = map["has_subtitles"],
        has_richsync = map["has_richsync"],
        num_favourite = map["num_favourite"],
        album_id = map["album_id"],
        album_name = map["album_name"],
        artist_id = map["artist_id"],
        artist_name = map["artist_name"],
        track_share_url = map["track_share_url"],
        track_edit_url = map["track_edit_url"],
        restricted = map["restricted"],
        updated_time = map["updated_time"],
        primary_genres = Primary_genres.fromJsonMap(map["primary_genres"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['track_id'] = track_id;
    data['track_name'] = track_name;
    data['track_name_translation_list'] = track_name_translation_list;
    data['track_rating'] = track_rating;
    data['commontrack_id'] = commontrack_id;
    data['instrumental'] = instrumental;
    data['explicit'] = explicit;
    data['has_lyrics'] = has_lyrics;
    data['has_subtitles'] = has_subtitles;
    data['has_richsync'] = has_richsync;
    data['num_favourite'] = num_favourite;
    data['album_id'] = album_id;
    data['album_name'] = album_name;
    data['artist_id'] = artist_id;
    data['artist_name'] = artist_name;
    data['track_share_url'] = track_share_url;
    data['track_edit_url'] = track_edit_url;
    data['restricted'] = restricted;
    data['updated_time'] = updated_time;
    data['primary_genres'] =
        primary_genres == null ? null : primary_genres.toJson();
    return data;
  }
}
