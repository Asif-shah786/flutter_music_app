import 'package:equatable/equatable.dart';

import '../../models/album_model.dart';

abstract class TrackEvent extends Equatable{

  const TrackEvent();

  @override
  // TODO: implement props
  List<Track> get props => [];
}

class GetTrackList extends TrackEvent{

}
class GetTrackDetails extends TrackEvent{
  const GetTrackDetails(this.trackId);
  final String trackId;
}