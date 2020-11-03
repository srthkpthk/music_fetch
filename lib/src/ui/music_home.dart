import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:music_fetch/src/data/bloc/music_bloc.dart';
import 'package:music_fetch/src/data/model/music_list/track.dart';
import 'package:music_fetch/src/ui/music_detail_screen.dart';

class MusicHome extends StatefulWidget {
  @override
  _MusicHomeState createState() => _MusicHomeState();
}

class _MusicHomeState extends State<MusicHome> {
  int _currentIndex = 0;
  final List<Widget> _children = [];

  @override
  Widget build(BuildContext context) {
    _children.addAll(
      [
        BlocBuilder(
          cubit: context.bloc<MusicBloc>(),
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
              return ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
                itemCount: state.musicEntity.message.body.track_list.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MusicDetailScreen(
                          state.musicEntity.message.body.track_list[index].track
                              .track_id,
                        ),
                      ),
                    ),
                    title: Text(state.musicEntity.message.body.track_list[index]
                        .track.track_name),
                    leading: Icon(Icons.library_music),
                    subtitle: Text(state.musicEntity.message.body
                        .track_list[index].track.album_name),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.bookmark_border,
                      ),
                      onPressed: () async {
                        final hive = await Hive.openBox<Track>('bookmark_list');
                        hive
                            .add(
                              Track(
                                  state.musicEntity.message.body
                                      .track_list[index].track.track_id,
                                  state.musicEntity.message.body
                                      .track_list[index].track.track_name,
                                  state.musicEntity.message.body
                                      .track_list[index].track.album_name,
                                  state.musicEntity.message.body
                                      .track_list[index].track.artist_name),
                            )
                            .whenComplete(
                              () => Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Added To Bookmarks'),
                                ),
                              ),
                            );
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
        FutureBuilder(
          future: Hive.openBox<Track>('bookmark_list'),
          builder: (context, AsyncSnapshot<Box<Track>> snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data.toMap().values.toList();
              return ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MusicDetailScreen(
                          data[index].track_id,
                        ),
                      ),
                    ),
                    title: Text(data[index].track_name),
                    leading: Icon(Icons.library_music),
                    subtitle: Text(data[index].album_name),
                  );
                },
              );
            } else
              return CircularProgressIndicator();
          },
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Trending',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save),
            label: 'Saved',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
