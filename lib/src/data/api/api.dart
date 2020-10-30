import 'package:dio/dio.dart';
import 'package:music_fetch/src/util/nointernet_exception.dart';

class MusicFetchApi {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.musixmatch.com/ws/1.1/',
      queryParameters: {
        'apikey': API_KEY,
      },
    ),
  );
}
