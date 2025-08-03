import 'package:nucleartension/domain/models/events/event.dart';
import 'package:nucleartension/domain/models/players/player.dart';
import 'package:nucleartension/domain/types/attack_type.dart';

abstract class Attack {
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

  AttackType get attackType =>
      attacker.isSelf ? AttackType.outgoing : AttackType.incoming;

  bool contains(Player player) => (attacker == player) || (defender == player);

  Duration get timeLeft => Duration(seconds: remainingTime.ceil());

  bool get isCompleted => remainingTime <= 0;

  bool update(double dt) {
    remainingTime -= dt;

    return isCompleted;
  }

  List<Event> resolve();
}
