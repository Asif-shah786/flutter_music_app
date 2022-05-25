class ApiPath{
  // String key = 'c088bc6efc7a1e7433a3c7dd048a597d';
  static get key => 'c088bc6efc7a1e7433a3c7dd048a597d';
  static String allTracksApi()  => 'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=$key';
  static String trackDetailApi (String trackId) => 'https://api.musixmatch.com/ws/1.1/track.get?track_id=$trackId&apikey=$key';
  static String trackLyricsApi (String  trackId) => 'https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackId&apikey=$key';
}