part of 'music_bloc.dart';

@immutable
abstract class MusicEvent {}

class FetchMusic extends MusicEvent {}

class FetchMusicDetails extends MusicEvent {
  final int id;

  FetchMusicDetails(this.id);
}
