import 'dart:math';
import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/models/attacks/attack.dart';
import 'package:nucleartension/models/events/army_attack_result_event.dart';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/events/player_defeated_event.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/utils/localizations.dart';

class ArmyAttack extends Attack {
  final int amount;

  ArmyAttack._({
    required super.attacker,
    required super.defender,
    required super.duration,
    required this.amount,
  });

  factory ArmyAttack.from({
    required Player attacker,
    required Player defender,
    required int amount,
  }) {
    final num decreaseRate = attacker.armyAttackWarningWhenAttacking;
    final num increaseRate = defender.armyAttackWarningWhenDefending;
    final num duration =
        Constants.ARMY_ATTACK_WARNING_TIME * decreaseRate * increaseRate;

    return ArmyAttack._(
      attacker: attacker,
      defender: defender,
      duration: duration,
      amount: amount,
    );
  }

  @override
  String toString() {
    if (attacker.isSelf) {
      return Localized.get.attackArmyOutgoing(defender.name, amount);
    } else if (defender.isSelf) {
      return Localized.get.attackArmyIncoming(attacker.name, amount);
    } else {
      return '';
    }
  }

  @override
  List<Event> resolve() {
    if (defender.isAlive) {
      if (defender.armies >= amount) {
        defender.removeArmies(amount);

        return [
          ArmyAttackResultEvent(
            attacker: attacker,
            defender: defender,
            winner: defender,
            amount: amount,
            casualties: 0,
          )
        ];
      } else {
        final int diff = amount - defender.armies;
        final int casualties = diff * Constants.ARMY_ATTACK_DAMAGE;
        final int totalCasualties = min(casualties, defender.population);
        final ResourceMap loot = defender.removePopulation(casualties);

        final List<Event> result = [
          ArmyAttackResultEvent(
            attacker: attacker,
            defender: defender,
            winner: attacker,
            amount: amount,
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
