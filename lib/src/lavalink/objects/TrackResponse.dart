part of nyxx.lavalink;

/// Response of Lavalink api
class TrackResponse {
  /// Type of response
  String loadType;

  /// Represents [Track] or [Playlist]
  Entity entity;

  /// Raw object returned by api
  Map<String, dynamic> raw;

  TrackResponse._new(this.raw) {
    loadType = raw['loadType'] as String;

    if (loadType == "TRACK_LOADED") {
      entity = Track._new(raw['tracks'].first as Map<String, dynamic>);
    } else if (loadType == "PLAYLIST_LOADED") {
      entity = Playlist._new(raw);
    }
  }
}
