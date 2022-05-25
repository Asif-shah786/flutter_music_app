import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../models/album_model.dart';
import '../models/my_lyrics_track_model.dart';
import '../models/my_track_model.dart';
import 'api_path.dart';

class ApiProvider{
  Future<List<TrackList>> fetchTrackList() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result) {
      print('YAY! Free cute dog pics!');
      final response = await http.get(Uri.parse(ApiPath.allTracksApi()));
      Map<String, dynamic> body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        List<TrackList> trackList = [];
        AlbumModel.fromJson(body).message!.body!.trackList!.forEach((element) {
          if (element.track!.hasLyrics == 1) {
            trackList.add(element);
          }
        });
        print(trackList[0].track!.trackId.toString());
        print(' Api Provider is Returning List');
        return trackList;
      }
      print(' Api Provider is Returning NULL List');

      return [TrackList(track: Track(trackName: 'null'))];
    } else {
      print(' Api Provider is Returning Empty List');
      return [];
    }
  }

  Future<Map<String, dynamic>> fetchTrackDetail({required String trackId}) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if(result){
      print('YAY! Free cute dog pics!');
      final responseDetails =
      await http.get(Uri.parse(ApiPath.trackDetailApi(trackId)));
      final responseLyrics =
      await http.get(Uri.parse(ApiPath.trackLyricsApi(trackId)));
      Map<String, dynamic> trackDetail = {};
      if (responseLyrics.statusCode == 200) {
        trackDetail['details'] =
            MyTrackModel.fromJson(jsonDecode(responseDetails.body));
        trackDetail['lyrics'] =
            MyTrackLyricsModel.fromJson(jsonDecode(responseLyrics.body));

        return trackDetail;
      } else {
        print('Status code != 200');
        return trackDetail;
      }
    }
    else{
      print('YAY! Free cute dog pics!');
      return{'error' : 'No Internet Connection'};
    }

  }
}