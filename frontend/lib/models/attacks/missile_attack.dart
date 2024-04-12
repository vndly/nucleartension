import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/models/attacks/attack.dart';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/events/missile_attack_result_event.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/utils/formatter.dart';

class MissileAttack extends Attack {
  final int totalMissiles;
  final int ktPerMissile;

  MissileAttack._({
    required super.attacker,
    required super.defender,
    required super.duration,
    required this.totalMissiles,
    required this.ktPerMissile,
  });

  factory MissileAttack.from({
    required Player attacker,
    required Player defender,
    required int amount,
    required int ktPerMissile,
  }) {
    final num decreaseRate = attacker.missileAttackWarningWhenAttacking;
    final num increaseRate = defender.missileAttackWarningWhenDefending;
    final num duration =
        Constants.MISSILE_ATTACK_WARNING_TIME * decreaseRate * increaseRate;

    return MissileAttack._(
      attacker: attacker,
      defender: defender,
      duration: duration,
      totalMissiles: amount,
      ktPerMissile: ktPerMissile,
    );
  }

  @override
  String toString() {
    if (attacker.isSelf) {
      return 'OUTGOING MISSILE ATTACK TO ${defender.name} WITH $totalMissiles MISSILES (${Formatter.yield(totalMissiles * ktPerMissile)})';
    } else if (defender.isSelf) {
      return 'INCOMING MISSILE ATTACK FROM ${attacker.name} WITH $totalMissiles MISSILES (${Formatter.yield(totalMissiles * ktPerMissile)})';
    } else {
      return '';
    }
  }

  @override
  Event resolve() {
    /*if (defender.militaryPower >= militaryPower) {
      defender.removeMilitaryPower(militaryPower);

      return UnitAttackResultEvent(
        attacker: attacker,
        defender: defender,
        winner: defender,
        militaryPower: militaryPower,
        defenderLoses: 0,
      );
    } else {
      final int diff = militaryPower - defender.militaryPower;
      final int population = diff * Constants.UNIT_ATTACK_DAMAGE_PER_POWER;
      defender.removePopulation(population);

      return UnitAttackResultEvent(
        attacker: attacker,
        defender: defender,
        winner: attacker,
        militaryPower: militaryPower,
        defenderLoses: population,
      );
    }*/

    final int effectiveMissiles = totalMissiles ~/ 2;
    final int population = effectiveMissiles *
        ktPerMissile *
        Constants.MISSILE_ATTACK_DAMAGE_PER_KT;

    return MissileAttackResultEvent(
      attacker: attacker,
      defender: defender,
      winner: attacker,
      totalMissiles: totalMissiles,
      effectiveMissiles: effectiveMissiles,
      ktPerMissile: ktPerMissile,
      defenderLoses: population,
    );
  }
}
