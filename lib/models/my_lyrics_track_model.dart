class MyTrackLyricsModel {
  MyTrackLyricsModel({
    int? lyricsId,
    String? lyricsBody,
  }) {
    _lyricsId = lyricsId;
    _lyricsBody = lyricsBody;
  }
  MyTrackLyricsModel.withError(String errorMessage){
    error = errorMessage;
  }

  int? _lyricsId;
  String? _lyricsBody;
  String? error;

  MyTrackLyricsModel.fromJson(dynamic json) {
    _lyricsId = json['message']['body']['lyrics']['lyrics_id'];
    _lyricsBody = json['message']['body']['lyrics']['lyrics_body'];
  }
  MyTrackLyricsModel copyWith({
    int? lyricsId,
    String? lyricsBody,
  }) =>
      MyTrackLyricsModel(
        lyricsId: lyricsId ?? _lyricsId,
        lyricsBody: lyricsBody ?? _lyricsBody,
      );
  int get lyricsId => _lyricsId!;
  String get lyricsBody => _lyricsBody!;
}
