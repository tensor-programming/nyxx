part of nyxx;

/// The client user.
class ClientUser extends User {
  /// The client user's email, null if the client user is a bot.
  String email;

  /// Weather or not the client user's account is verified.
  bool verified;

  /// Weather or not the client user has MFA enabled.
  bool mfa;

  ClientUser._new(Client client, Map<String, dynamic> data)
      : super._new(client, data) {
    this.email = raw['email'] as String;
    this.verified = raw['verified'] as bool;
    this.mfa = raw['mfa_enabled'] as bool;
    this.client = client;
  }

  /// Updates the client's status.
  ///     ClientUser.setStatus(status: 'dnd');
  ClientUser setStatus({String status: null}) {
    return this.setPresence(status: status);
  }

  /// Updates the client's game.
  ///     ClientUser.setGame(name: '<3');
  ClientUser setGame({Game game}) {
    return this.setPresence(game: game);
  }

  /// Updates the client's presence.
  ///     ClientUser.setPresence(status: s, activity: { 'name': args.join(' ') });
  ClientUser setPresence(
      {String status: null, bool afk: false, Game game: null}) {
    this.client.shards.forEach((int id, Shard shard) {
      shard.setPresence(status: status, afk: afk, game: game);
    });

    return this;
  }
}
