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

  @override
  String toString() {
    if (attacker.isSelf) {
      return 'OUTGOING UNIT ATTACK TO ${defender.name} WITH $militaryPower';
    } else if (defender.isSelf) {
      return 'INCOMING UNIT ATTACK FROM ${attacker.name} WITH $militaryPower';
    } else {
      return '';
    }
  }

  @override
  void resolve() {
    if (defender.militaryPower >= militaryPower) {
      defender.removeMilitaryPower(militaryPower);
    } else {
      final int diff = militaryPower - defender.militaryPower;
      final int population = diff * Constants.UNIT_ATTACK_DAMAGE_PER_POWER;
      defender.removePopulation(population);
    }
  }
}
