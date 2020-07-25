import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_fetch/src/data/bloc/music_bloc.dart';
import 'package:music_fetch/src/data/repository/music_repo.dart';
import 'package:music_fetch/src/ui/music_home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Songs',
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider<MusicRepository>(
        create: (BuildContext context) => MusicRepository(),
        child: BlocProvider<MusicBloc>(
            create: (BuildContext context) =>
                MusicBloc(RepositoryProvider.of<MusicRepository>(context))
                  ..add(FetchMusic()),
            child: MusicHome()),
      ),
    );
  }
}
