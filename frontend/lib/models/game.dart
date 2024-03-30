import 'package:nucleartension/models/player.dart';

class Game {
  final List<Player> players;
  num timeElapsed = 0;
  int defcon = 5;

  Game({
    required this.players,
    required this.timeElapsed,
    required this.defcon,
  });

  int get defconStep => 6 - defcon;

  Player get player => players[0];

  // ============================= UPDATE =================================== \\

  void update(double dt) {
    timeElapsed += dt;

    for (final Player player in players) {
      player.update(dt);
    }
  }
}
