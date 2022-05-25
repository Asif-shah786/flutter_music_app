import '../models/album_model.dart';
import '../models/my_track_model.dart';
import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<List<TrackList>> fetchTrackList() {
    return _provider.fetchTrackList();
  }

  Future<Map<String, dynamic>> fetchTrackDetails(String? trackId){
    return _provider.fetchTrackDetail(trackId: trackId!);
  }

}