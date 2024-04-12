import 'package:nucleartension/models/players/player.dart';

class Attack {
  final Player attacker;
  final Player defender;
  num totalTime = 0;
  num remainingTime = 0;

  Attack({
    required this.attacker,
    required this.defender,
    required num duration,
  }) {
    totalTime = duration;
    remainingTime = totalTime;
  }

  bool contains(Player player) => (attacker == player) || (defender == player);

  Duration get timeLeft => Duration(seconds: remainingTime.ceil());

  bool get isCompleted => remainingTime <= 0;

  bool update(double dt) {
    remainingTime -= dt;

    return isCompleted;
  }

  void resolve() {
    // TODO(momo): implement
  }
}
