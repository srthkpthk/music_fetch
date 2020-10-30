import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:music_fetch/src/data/bloc/music_bloc.dart';
import 'package:music_fetch/src/data/model/music_list/track.dart';
import 'package:music_fetch/src/data/repository/music_repo.dart';
import 'package:music_fetch/src/ui/music_home.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TrackAdapter());
  await Hive.openBox<Track>('bookmark_list');
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Songs',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: RepositoryProvider<MusicRepository>(
        create: (BuildContext context) => MusicRepository(),
        child: BlocProvider<MusicBloc>(
          create: (BuildContext context) =>
              MusicBloc(RepositoryProvider.of<MusicRepository>(context))
                ..add(FetchMusic()),
          child: MusicHome(),
        ),
      ),
    );
  }
}
