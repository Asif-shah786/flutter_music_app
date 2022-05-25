import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_music_app/blocs/track_bloc/track_event.dart';
import 'package:flutter_music_app/blocs/track_bloc/track_state.dart';
import 'package:flutter_music_app/services/api_repository.dart';

import '../../models/album_model.dart';

class TrackBloc extends Bloc<TrackEvent, TrackState> {
  TrackBloc() : super(TrackInitial())
  {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetTrackList>((event, emit) async {
      try {
        emit(TrackLoading());
        final List<TrackList> myTrackList =
            await _apiRepository.fetchTrackList();
        print('Emitting Track Loaded');
        emit(TrackLoaded(myTrackList: myTrackList));
        print('Emitted Track Loaded');

      } catch (e) {
        emit(TrackError(e.toString()));
        print(e.toString());
      }
    });
    on<GetTrackDetails>((event, emit) async {
      try {
        emit(TrackLoading());
        final myTrackDetails = await _apiRepository.fetchTrackDetails(event.trackId);
        print('Emitting Track Details Loaded');
        emit(TrackLoaded(myTrackDetails: myTrackDetails));
        print('Emitted Track Details  Loaded');

      } catch (e) {
        emit(TrackError(e.toString()));
        print(e.toString());
      }
    });

  }
}
