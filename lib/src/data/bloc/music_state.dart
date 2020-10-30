part of 'music_bloc.dart';

@immutable
abstract class MusicState {}

class MusicInitial extends MusicState {}

class MusicFetchComplete extends MusicState {
  final MusicEntity musicEntity;
  final SingleMusicEntity singleMusicEntity;
  final LyricsEntity lyricsEntity;

  MusicFetchComplete({
    this.musicEntity,
    this.singleMusicEntity,
    this.lyricsEntity,
  });
}

class MusicFetchFailed extends MusicState {}

class InternetNotAvailable extends MusicState {}
