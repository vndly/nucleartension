import 'dart:math';
import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/models/attacks/attack.dart';
import 'package:nucleartension/models/events/army_attack_result_event.dart';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/events/player_defeated_event.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/utils/localizations.dart';

class TroopAttack extends Attack {
  final int troop;

  TroopAttack._({
    required super.attacker,
    required super.defender,
    required super.duration,
    required this.troop,
  });

  factory TroopAttack.from({
    required Player attacker,
    required Player defender,
    required int troop,
  }) {
    final num decreaseRate = attacker.troopAttackWarningWhenAttacking;
    final num increaseRate = defender.troopAttackWarningWhenDefending;
    final num duration =
        Constants.TROOP_ATTACK_WARNING_TIME * decreaseRate * increaseRate;

    return TroopAttack._(
      attacker: attacker,
      defender: defender,
      duration: duration,
      troop: troop,
    );
  }

  @override
  String toString() {
    if (attacker.isSelf) {
      return Localized.get.attackArmyOutgoing(defender.name, troop);
    } else if (defender.isSelf) {
      return Localized.get.attackArmyIncoming(attacker.name, troop);
    } else {
      return '';
    }
  }

  @override
  List<Event> resolve() {
    if (defender.isAlive) {
      if (defender.troops >= troop) {
        defender.removeTroops(troop);

        return [
          TroopAttackResultEvent(
            attacker: attacker,
            defender: defender,
            winner: defender,
            troops: troop,
            casualties: 0,
          )
        ];
      } else {
        final int diff = troop - defender.troops;
        final int casualties = diff * Constants.TROOP_ATTACK_DAMAGE;
        final int totalCasualties = min(casualties, defender.population);
        final ResourceMap loot = defender.removePopulation(casualties);

        final List<Event> result = [
          TroopAttackResultEvent(
            attacker: attacker,
            defender: defender,
            winner: attacker,
            troops: troop,
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
