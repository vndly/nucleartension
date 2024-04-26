import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/models/attacks/attack.dart';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/events/player_defeated_event.dart';
import 'package:nucleartension/models/events/unit_attack_result_event.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/utils/localizations.dart';

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
      return Localized.get.attackUnitOutgoing(defender.name, militaryPower);
    } else if (defender.isSelf) {
      return Localized.get.attackUnitIncoming(attacker.name, militaryPower);
    } else {
      return '';
    }
  }

  @override
  List<Event> resolve() {
    if (defender.isAlive) {
      if (defender.militaryPower >= militaryPower) {
        defender.removeMilitaryPower(militaryPower);

        return [
          UnitAttackResultEvent(
            attacker: attacker,
            defender: defender,
            winner: defender,
            militaryPower: militaryPower,
            casualties: 0,
          )
        ];
      } else {
        final int diff = militaryPower - defender.militaryPower;
        final int casualties = diff * Constants.UNIT_ATTACK_DAMAGE_PER_POWER;
        final ResourceMap loot = defender.removePopulation(casualties);

        final List<Event> result = [
          UnitAttackResultEvent(
            attacker: attacker,
            defender: defender,
            winner: attacker,
            militaryPower: militaryPower,
            casualties: casualties,
          )
        ];

        if (!defender.isAlive) {
          attacker.resources.addItems(loot);

          result.add(PlayerDefeated(
            player: defender,
            killer: attacker,
          ));
        }

        return result;
      }
    } else {
      return [];
    }
  }
}
