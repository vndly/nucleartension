import 'dart:ui';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/event_type.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/palette.dart';

class TroopAttackResultEvent extends Event {
  final Player attacker;
  final Player defender;
  final Player winner;
  final int troops;
  final int casualties;

  TroopAttackResultEvent({
    required this.attacker,
    required this.defender,
    required this.winner,
    required this.troops,
    required this.casualties,
  }) : super(eventType: EventType.troop_attack_result);

  @override
  bool get show => attacker.isSelf || defender.isSelf;

  @override
  Color get titleColor => attacker.isSelf
      ? Palette.eventAttackOutgoing
      : Palette.eventAttackIncoming;

  @override
  List<String> get text => [
        Localized.get.eventAttackArmyResultLine1,
        Localized.get.eventAttackArmyResultLine2(attacker.name,
            (attacker == winner) ? ' (${Localized.get.labelWinner})' : ''),
        Localized.get.eventAttackArmyResultLine3(defender.name,
            (defender == winner) ? ' (${Localized.get.labelWinner})' : ''),
        Localized.get.eventAttackArmyResultLine4(Formatter.resourceRaw(troops)),
        Localized.get.eventAttackArmyResultLine5((casualties > 0)
            ? Localized.get.labelPeople(Formatter.resourceRaw(casualties))
            : Localized.get.labelNone),
      ];
}
