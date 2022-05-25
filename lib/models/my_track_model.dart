class MyTrackModel {
  MyTrackModel({
    int? trackId,
    String? trackName,
    String? artistName,
    String? albumName,
    int? explicit,
    int? trackRating,
  }) {
    _trackId = trackId;
    _trackName = trackName;
    _artistName = artistName;
    _explicit = explicit;
    _trackRating = trackRating;
  }
  MyTrackModel.withError(String errorMessage){
    error = errorMessage;
  }
  int? _trackId;
  String? _trackName;
  String? _artistName;
  String? _albumName;
  int? _explicit;
  int? _trackRating;
  String? error;

  MyTrackModel.fromJson(dynamic json) {
    final track = json['message']['body']['track'];
    _trackId = track['track_id'];
    _trackName = track['track_name'];
    _artistName = track['artist_name'];
    _albumName = track['album_name'];
    _explicit = track['explicit'];
    _trackRating = track['track_rating'];
  }
  MyTrackModel copyWith({
    int? trackId,
    String? trackName,
    String? artistName,
    String? albumName,
    int? explicit,
    int? trackRating,
  }) =>
      MyTrackModel(
        trackId: trackId ?? _trackId,
        trackName: trackName ?? _trackName,
        artistName: artistName ?? _artistName,
        albumName: albumName ?? _albumName,
        explicit: explicit ?? _explicit,
        trackRating: trackRating ?? _trackRating,
      );
  int get trackId => _trackId!;
  String get trackName => _trackName!;
  String get artistName => _artistName!;
  String get albumName => _albumName!;
  int get explicit => _explicit!;
  int get trackRating => _trackRating!;
}
