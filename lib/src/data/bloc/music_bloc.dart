import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';
import 'package:music_fetch/src/data/model/lyrics/LyricsEntity.dart';
import 'package:music_fetch/src/data/model/music_list/MusicEntity.dart';
import 'package:music_fetch/src/data/model/single_music/SingleMusicEntity.dart';
import 'package:music_fetch/src/data/repository/music_repo.dart';

part 'music_event.dart';
part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  MusicRepository repo;
  MusicBloc(this.repo) : super(MusicInitial());

  @override
  Stream<MusicState> mapEventToState(
    MusicEvent event,
  ) async* {
    if (event is FetchMusic) {
      var conn = await (Connectivity().checkConnectivity());
      if (conn == ConnectivityResult.mobile ||
          conn == ConnectivityResult.wifi) {
        MusicEntity musicEntity = await repo.getMusic();
        if (musicEntity.message.header.status_code == 200) {
          yield MusicFetchComplete(musicEntity: musicEntity);
        } else {
          yield MusicFetchFailed();
        }
      } else {
        yield InternetNotAvailable();
      }
    }
    if (event is FetchMusicDetails) {
      var conn = await (Connectivity().checkConnectivity());
      if (conn == ConnectivityResult.mobile ||
          conn == ConnectivityResult.wifi) {
        SingleMusicEntity singleMusicEntity =
            await repo.getMusicByCommonTrackID(event.id);
        LyricsEntity lyricsEntity =
            await repo.getLyricsByCommonTrackID(event.id);
        if (singleMusicEntity.message.header.status_code == 200 &&
            lyricsEntity.message.header.status_code == 200) {
          yield MusicFetchComplete(
              singleMusicEntity: singleMusicEntity, lyricsEntity: lyricsEntity);
        } else {
          yield MusicFetchFailed();
        }
      } else {
        yield InternetNotAvailable();
      }
    }
  }
}
