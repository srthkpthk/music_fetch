import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_fetch/src/data/bloc/music_bloc.dart';
import 'package:music_fetch/src/data/repository/music_repo.dart';

class MusicDetailScreen extends StatelessWidget {
  final int id;

  MusicDetailScreen(this.id);

  final _bloc = MusicBloc(MusicRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Track Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder(
        cubit: _bloc,
        // ignore: missing_return
        builder: (BuildContext context, state) {
          if (state is MusicInitial) {
            _bloc.add(FetchMusicDetails(id));
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MusicFetchFailed) {
            return Center(
              child: Text('Music Fetch Failed'),
            );
          }
          if (state is InternetNotAvailable) {
            return Center(
              child: Text('Internet Not Available'),
            );
          }
          if (state is MusicFetchComplete) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildHeading('Name'),
                _buildChildText(
                    state.singleMusicEntity.message.body.track.track_name),
                Divider(),
                _buildHeading('Artist'),
                _buildChildText(
                    state.singleMusicEntity.message.body.track.artist_name),
                Divider(),
                _buildHeading('Album Name'),
                _buildChildText(
                    state.singleMusicEntity.message.body.track.album_name),
                Divider(),
                _buildHeading('Explicit'),
                _buildChildText(state
                    .singleMusicEntity.message.body.track.explicit
                    .toString()),
                Divider(),
                _buildHeading('Rating'),
                _buildChildText(state
                    .singleMusicEntity.message.body.track.track_rating
                    .toString()),
                Divider(),
                _buildHeading('Lyrics'),
                _buildChildText(
                    state.lyricsEntity.message.body.lyrics.lyrics_body)
              ],
            );
          }
        },
      ),
    );
  }

  _buildHeading(String s) => Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          s,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );

  _buildChildText(String track_name) => Padding(
        padding: const EdgeInsets.all(10),
        child: Text(track_name),
      );
}
