import 'package:flutter/material.dart';
import 'package:flutter_music_app/blocs/track_bloc/track_bloc.dart';
import 'package:flutter_music_app/blocs/track_bloc/track_event.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../main.dart';
import '../../models/connection_util.dart';
import 'body.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TrackBloc musicListBloc = TrackBloc();
  // bool hasInterNetConnection = false;

  @override
  void initState() {
    connectionUtilModel.initialize();
    // connectionUtilModel.connectionChange.listen(connectionChanged);
    musicListBloc.add(GetTrackList());
    super.initState();
  }

  // void connectionUtil() {
  //   print('here');
  //   ConnectionUtil connectionStatus = ConnectionUtil.getInstance();
  //   connectionStatus.initialize();
  //   connectionStatus.connectionChange.listen(connectionChanged);
  // }

  // void connectionChanged(dynamic hasConnection) {
  //   setState(() {
  //     hasInterNetConnection = hasConnection;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ConnectionUtil>(
      builder: (BuildContext context, Widget? child, ConnectionUtil model) {
        bool hasInterNetConnection = model.hasConnection;
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Trending'),
              centerTitle: true,
            ),
            body: buildBody(hasInterNetConnection, musicListBloc),
          ),
        );
      },
    );
  }
  //
  // Widget buildUi(bool hasInterNetConnection) {
  //   print(hasInterNetConnection);
  //
  //   if (hasInterNetConnection) {
  //     return const Center(child: Text('You are online'));
  //   }
  //   return const Center(child: Text('You are offline'));
  // }

}
