import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_fetch/src/data/bloc/music_bloc.dart';
import 'package:music_fetch/src/data/repository/music_repo.dart';
import 'package:music_fetch/src/ui/music_detail_screen.dart';

class MusicHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hey'),
      ),
      body: BlocBuilder(
        cubit: BlocProvider.of<MusicBloc>(context),
// ignore: missing_return
        builder: (BuildContext context, state) {
          if (state is MusicInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MusicFetchFailed) {
            return Center(
              child: Text('fetch failed'),
            );
          }
          if (state is InternetNotAvailable) {
            return Center(
              child: Text('Internet Not Available'),
            );
          }
          if (state is MusicFetchComplete) {
            return ListView.builder(
              itemCount: state.musicEntity.message.body.track_list.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MusicDetailScreen(state
                              .musicEntity
                              .message
                              .body
                              .track_list[index]
                              .track
                              .commontrack_id))),
                  title: Text(state.musicEntity.message.body.track_list[index]
                      .track.track_name),
                  leading: Icon(Icons.music_note),
                  subtitle: Text(state.musicEntity.message.body
                      .track_list[index].track.album_name),
                  trailing: Text(state.musicEntity.message.body
                      .track_list[index].track.commontrack_id
                      .toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
