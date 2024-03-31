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

  // ============================= DEFCON =================================== \\

  void onMilitaryCreated() => _applyDefcon(4);

  void onMilitaryUsed() => _applyDefcon(3);

  void onAttackMissileCreated() => _applyDefcon(2);

  void onAttackMissileUsed() => _applyDefcon(1);

  void _applyDefcon(int value) {
    if (defcon > value) {
      defcon = value;
    }
  }

  // ============================= UPDATE =================================== \\

  void update(double dt) {
    timeElapsed += dt;

    for (final Player player in players) {
      player.update(dt);
    }
  }
}
