import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/players/self_player.dart';
import 'package:nucleartension/utils/custom_snackbar.dart';

class Game {
  final List<Player> players;
  SelfPlayer? selfPlayer;
  num timeElapsed = 0;
  int defcon = 5;

  Game({
    required this.players,
    required this.timeElapsed,
    required this.defcon,
  });

  int get defconStep => 6 - defcon;

  SelfPlayer get player => selfPlayer!;

  void setPlayers(List<Player> list) {
    players.addAll(list);
    selfPlayer = list.whereType<SelfPlayer>().first;
  }

  // ============================= DEFCON =================================== \\

  void onMilitaryCreated() => _applyDefcon(4);

  void onMilitaryUsed() => _applyDefcon(3);

  void onAttackMissileCreated() => _applyDefcon(2);

  void onAttackMissileUsed() => _applyDefcon(1);

  void _applyDefcon(int value) {
    if (defcon > value) {
      defcon = value;
      CustomSnackbar.defcon(value);
    }
  }

  // ============================ MILITARY ================================== \\

  void onAttackPlayerMilitary(Player player) {}

  void onAttackPlayerMissiles(Player player) {}

  // ============================= UPDATE =================================== \\

  void update(double dt) {
    timeElapsed += dt;

    for (final Player player in players) {
      player.update(dt);
    }
  }
}
