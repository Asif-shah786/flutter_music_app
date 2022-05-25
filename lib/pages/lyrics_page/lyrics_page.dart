import 'package:flutter/material.dart';
import 'package:flutter_music_app/blocs/track_bloc/track_bloc.dart';
import 'package:flutter_music_app/blocs/track_bloc/track_event.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../models/connection_util.dart';
import '../../widgets/buildMusicTile.dart';
import '../home_page/home_page.dart';
import '../lyrics_page/body.dart';


class LyricsPage extends StatefulWidget {
  const LyricsPage({Key? key, required this.trackId})
      : super(key: key);
  final String trackId;


  @override
  State<LyricsPage> createState() => _LyricsPageState();
}

class _LyricsPageState extends State<LyricsPage> {

  final TrackBloc _musicDetailBloc = TrackBloc();

  @override
  void initState(){
    print('Button Tapped');
    _musicDetailBloc.add(GetTrackDetails(widget.trackId));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return ScopedModelDescendant(
      builder: (BuildContext context, Widget? child, ConnectionUtil model) {
        bool hasInterNetConnection = model.hasConnection;
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: const Text('Track Details'),
                centerTitle: true,
              ),
              body: buildBody(hasInterNetConnection, _musicDetailBloc)),
        );
      },
    );
  }

}
