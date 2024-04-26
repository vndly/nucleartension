import 'dart:math';

import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/models/attacks/attack.dart';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/events/missile_attack_result_event.dart';
import 'package:nucleartension/models/events/player_defeated_event.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/probability.dart';

class MissileAttack extends Attack {
  final int totalMissiles;
  final int yieldPerMissile;

  MissileAttack._({
    required super.attacker,
    required super.defender,
    required super.duration,
    required this.totalMissiles,
    required this.yieldPerMissile,
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
      yieldPerMissile: ktPerMissile,
    );
  }

  @override
  String toString() {
    final String yield = Formatter.yield(totalMissiles * yieldPerMissile);

    if (attacker.isSelf) {
      return Localized.get
          .attackMissileOutgoing(defender.name, totalMissiles, yield);
    } else if (defender.isSelf) {
      return Localized.get
          .attackMissileIncoming(attacker.name, totalMissiles, yield);
    } else {
      return '';
    }
  }

  @override
  List<Event> resolve() {
    if (defender.isAlive) {
      final int successfulAttackMissiles = _computeMissiles();
      final num totalYield = successfulAttackMissiles * yieldPerMissile;
      final int casualties =
          (totalYield * Constants.MISSILE_ATTACK_DAMAGE_PER_KT).floor();
      final Player winner =
          (successfulAttackMissiles > 0) ? attacker : defender;
      final int totalCasualties = min(casualties, defender.population);
      defender.removePopulation(casualties);

      final List<Event> result = [
        MissileAttackResultEvent(
          attacker: attacker,
          defender: defender,
          winner: winner,
          totalMissiles: totalMissiles,
          successfulAttackMissiles: successfulAttackMissiles,
          ktPerMissile: yieldPerMissile,
          casualties: totalCasualties,
        )
      ];

      if (!defender.isAlive) {
        result.add(PlayerDefeated(
          player: defender,
          killer: attacker,
        ));
      }

      return result;
    } else {
      return [];
    }
  }

  int _computeMissiles() {
    final num missileEffectiveness = defender.defenseMissilesEffectiveness -
        (1 - attacker.attackMissilesEffectiveness);
    final num defenseMissilesEffectiveness =
        missileEffectiveness * Constants.DEFENSE_MISSILE_EFFECTIVENESS;
    int remainingAttackMissiles = totalMissiles;

    while ((remainingAttackMissiles > 0) &&
        (defender.militaryDefenseMissiles > 0)) {
      defender.removeDefenseMissiles(1);

      if (Probability.succeeds(defenseMissilesEffectiveness)) {
        remainingAttackMissiles--;
      }
    }

    return remainingAttackMissiles;
  }
}
