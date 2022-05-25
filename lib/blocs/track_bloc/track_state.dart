import 'package:equatable/equatable.dart';
import '../../models/album_model.dart';

abstract class TrackState extends Equatable{
  @override
  // TODO: implement props
  List<Track> get props => [];

}

class TrackInitial extends TrackState{}
class TrackLoading extends TrackState{}
class InternetConnection extends TrackState{

}
class TrackLoaded extends TrackState{
  TrackLoaded({
    this.myTrackList,
    this.myTrackDetails,
  });

  final List<TrackList>? myTrackList;
  final Map<String, dynamic>? myTrackDetails;

}

class TrackError extends TrackState{
  final String? message;
  TrackError(this.message);
}
