class Primary_genres {
  List<Object> music_genre_list;

  Primary_genres.fromJsonMap(Map<String, dynamic> map)
      : music_genre_list = map["music_genre_list"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['music_genre_list'] = music_genre_list;
    return data;
  }
}
