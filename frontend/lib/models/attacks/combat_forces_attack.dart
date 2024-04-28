import 'dart:math';
import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/models/attacks/attack.dart';
import 'package:nucleartension/models/events/combat_forces_attack_result_event.dart';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/events/player_defeated_event.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/utils/localizations.dart';

class CombatForcesAttack extends Attack {
  final int combatForces;

  CombatForcesAttack._({
    required super.attacker,
    required super.defender,
    required super.duration,
    required this.combatForces,
  });

  factory CombatForcesAttack.from({
    required Player attacker,
    required Player defender,
    required int combatForces,
  }) {
    final num decreaseRate = attacker.combatForcesAttackWarningWhenAttacking;
    final num increaseRate = defender.combatForcesAttackWarningWhenDefending;
    final num duration = Constants.MILITARY_FORCE_ATTACK_WARNING_TIME *
        decreaseRate *
        increaseRate;

    return CombatForcesAttack._(
      attacker: attacker,
      defender: defender,
      duration: duration,
      combatForces: combatForces,
    );
  }

  @override
  String toString() {
    if (attacker.isSelf) {
      return Localized.get
          .attackCombatForcesOutgoing(defender.name, combatForces);
    } else if (defender.isSelf) {
      return Localized.get
          .attackCombatForcesIncoming(attacker.name, combatForces);
    } else {
      return '';
    }
  }

  @override
  List<Event> resolve() {
    if (defender.isAlive) {
      if (defender.combatForces >= combatForces) {
        defender.removeCombatForces(combatForces);

        return [
          CombatForcesAttackResultEvent(
            attacker: attacker,
            defender: defender,
            winner: defender,
            combatForces: combatForces,
            casualties: 0,
          )
        ];
      } else {
        final int diff = combatForces - defender.combatForces;
        final int casualties = diff * Constants.MILITARY_FORCE_ATTACK_DAMAGE;
        final int totalCasualties = min(casualties, defender.population);
        final ResourceMap loot = defender.removePopulation(casualties);

        final List<Event> result = [
          CombatForcesAttackResultEvent(
            attacker: attacker,
            defender: defender,
            winner: attacker,
            combatForces: combatForces,
            casualties: totalCasualties,
          )
        ];

        if (!defender.isAlive) {
          attacker.resources.addItems(loot);

          result.add(PlayerDefeated(
            player: defender,
            killer: attacker,
            loot: loot,
          ));
        }

        return result;
      }
    } else {
      return [];
    }
  }
}
