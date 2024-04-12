import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/models/attacks/attack.dart';
import 'package:nucleartension/models/players/player.dart';

class UnitAttack extends Attack {
  final int militaryPower;

  UnitAttack._({
    required super.attacker,
    required super.defender,
    required super.duration,
    required this.militaryPower,
  });

  factory UnitAttack.from({
    required Player attacker,
    required Player defender,
    required int militaryPower,
  }) {
    final num decreaseRate = attacker.unitAttackWarningWhenAttacking;
    final num increaseRate = defender.unitAttackWarningWhenDefending;
    final num duration =
        Constants.UNIT_ATTACK_WARNING_TIME * decreaseRate * increaseRate;

    return UnitAttack._(
      attacker: attacker,
      defender: defender,
      duration: duration,
      militaryPower: militaryPower,
    );
  }
}
