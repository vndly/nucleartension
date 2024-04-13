import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/models/attacks/attack.dart';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/events/missile_attack_result_event.dart';
import 'package:nucleartension/models/events/player_defeated_event.dart';
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
  List<Event> resolve() {
    // TODO(momo): implement
    final Player winner = attacker;
    final int effectiveMissiles = totalMissiles ~/ 2;
    final num resilienceEmergencyPlanning =
        defender.resilienceEmergencyPlanning;
    final num totalYield = effectiveMissiles *
        ktPerMissile *
        Constants.MISSILE_ATTACK_DAMAGE_PER_KT;
    final int population = (totalYield * resilienceEmergencyPlanning).floor();

    defender.removePopulation(population);

    final List<Event> result = [
      MissileAttackResultEvent(
        attacker: attacker,
        defender: defender,
        winner: winner,
        totalMissiles: totalMissiles,
        effectiveMissiles: effectiveMissiles,
        ktPerMissile: ktPerMissile,
        defenderLoses: population,
      )
    ];

    if (!defender.isAlive) {
      result.add(PlayerDefeated(player: defender));
    }

    return result;
  }
}
