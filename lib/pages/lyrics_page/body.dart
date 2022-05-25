import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/track_bloc/export_track_bloc.dart';
import '../../models/my_lyrics_track_model.dart';
import '../../models/my_track_model.dart';
import '../../widgets/buildMusicTile.dart';
import '../../widgets/show_toast.dart';


Widget buildBody(bool hasInterNetConnection, TrackBloc _musicDetailBloc,) {
  if (!hasInterNetConnection) {
    // showToastMessage('Offline');
    return const Center(
      child : Text('No Internet Connection'),
    );
  }
  return BlocProvider(
    create: (_) => _musicDetailBloc,
    child: BlocListener<TrackBloc, TrackState>(
      listener: (context, state) {
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
            print('Initial 2');
            return _buildLoading();
          }
          if (state is TrackLoading) {
            return _buildLoading();
          }
          if (state is TrackLoaded) {
            print('Loaded 2');
            print('Iam in Bloc BUilder of Lyrics');
            MyTrackModel details = state.myTrackDetails!['details'];
            MyTrackLyricsModel lyrics = state.myTrackDetails!['lyrics'];
            return buildSingleChildScrollView(details, lyrics);
          }
          if (state is TrackError) {
            print('Error 2');
            return Container();
          } else {
            print('Else 2');
            return Container();
          }
        },
      ),
    ),
  );
}

Center _buildLoading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

SingleChildScrollView buildSingleChildScrollView(details, lyrics) {
  return SingleChildScrollView(
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      buildListTile(
        title: 'Name',
        subTitle: details.trackName,
      ),
      buildListTile(title: 'Artist', subTitle: details.artistName),
      buildListTile(title: 'Album Name', subTitle: details.albumName),
      buildListTile(
          title: 'Explicit',
          subTitle: details.explicit == 1 ? 'True' : 'False'),
      buildListTile(
          title: 'Rating', subTitle: details.trackRating.toString()),
      buildListTile(title: 'Lyrics', subTitle: lyrics.lyricsBody.toString()),
    ]),
  );
}