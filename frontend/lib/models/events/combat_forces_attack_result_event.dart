import 'dart:ui';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/event_type.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/palette.dart';

class CombatForcesAttackResultEvent extends Event {
  final Player attacker;
  final Player defender;
  final Player winner;
  final int combatForces;
  final int casualties;

  CombatForcesAttackResultEvent({
    required this.attacker,
    required this.defender,
    required this.winner,
    required this.combatForces,
    required this.casualties,
  }) : super(eventType: EventType.combat_forces_attack_result);

  @override
  bool get show => attacker.isSelf || defender.isSelf;

  @override
  Color get titleColor => attacker.isSelf
      ? Palette.eventAttackOutgoing
      : Palette.eventAttackIncoming;

  @override
  List<String> get text => [
        Localized.get.eventAttackCombatForcesResultLine1,
        Localized.get.eventAttackCombatForcesResultLine2(attacker.name,
            (attacker == winner) ? ' (${Localized.get.labelWinner})' : ''),
        Localized.get.eventAttackCombatForcesResultLine3(defender.name,
            (defender == winner) ? ' (${Localized.get.labelWinner})' : ''),
        Localized.get.eventAttackCombatForcesResultLine4(
            Formatter.resourceRaw(combatForces)),
        Localized.get.eventAttackCombatForcesResultLine5((casualties > 0)
            ? Localized.get.labelPeople(Formatter.resourceRaw(casualties))
            : Localized.get.labelNone),
      ];
}
