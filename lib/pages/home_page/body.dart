import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/track_bloc/track_bloc.dart';
import '../../blocs/track_bloc/track_state.dart';
import '../../models/album_model.dart';
import '../../widgets/buildMusicTile.dart';
import '../../widgets/show_toast.dart';
import '../lyrics_page/lyrics_page.dart';

Widget buildBody(bool hasInterNetConnection, TrackBloc musicListBloc) {
  if (!hasInterNetConnection) {
    // _showToastMessage('Offline');
    return const Center(
      child : Text('No Internet Connection'),
    );
  }
  showToastMessage('Online');
  return Column(
    children: [
      Expanded(
        child: BlocProvider(
          create: (_) => musicListBloc,
          child: BlocListener<TrackBloc, TrackState>(
            listener: (
                context,
                state,
                ) {
              // TODO: implement listener
              if (state is TrackError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message!),
                  ),
                );
              }
            },
            child: BlocBuilder<TrackBloc, TrackState>(
              builder: (context, state) {
                if (state is TrackInitial) {
                  print('Initial 1');
                  return _buildLoading();
                }
                if (state is TrackLoading) {
                  print('Loading 1');
                  return _buildLoading();
                }
                if (state is TrackLoaded) {
                  print('Loaded 1');
                  return buildListView(state.myTrackList);
                }
                if (state is TrackError) {
                  print('Error 1');
                  return Container();
                } else {
                  print('Else 1');
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    ],
  );
}


Center _buildLoading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

ListView buildListView(List<TrackList>? snapshot) {
  return ListView.separated(
    separatorBuilder: (BuildContext context, index) => const Divider(
      color: Colors.grey,
      thickness: 0.4,
    ),
    itemCount: snapshot!.length,
    itemBuilder: (BuildContext context, int index) {
      final track = snapshot[index].track!;
      return buildListTile(
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      LyricsPage(trackId: track.trackId.toString()),
                )),
          },
          trackId: track.trackId,
          title: track.trackName!,
          subTitle: track.trackName!,
          leading: const Icon(Icons.play_circle_filled_outlined),
          trailing: track.albumName!);
    },
  );
}