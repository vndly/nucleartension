import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/event_type.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/localizations.dart';

class UnitAttackResultEvent extends Event {
  final Player attacker;
  final Player defender;
  final Player winner;
  final int militaryPower;
  final int defenderLoses;

  UnitAttackResultEvent({
    required this.attacker,
    required this.defender,
    required this.winner,
    required this.militaryPower,
    required this.defenderLoses,
  }) : super(eventType: EventType.unit_attack_result);

  @override
  List<String> get text => [
        Localized.get.eventAttackUnitResultLine1,
        Localized.get.eventAttackUnitResultLine2(attacker.name,
            (attacker == winner) ? ' (${Localized.get.labelWinner})' : ''),
        Localized.get.eventAttackUnitResultLine3(defender.name,
            (defender == winner) ? ' (${Localized.get.labelWinner})' : ''),
        Localized.get
            .eventAttackUnitResultLine4(Formatter.resourceRaw(militaryPower)),
        Localized.get.eventAttackUnitResultLine5((defenderLoses > 0)
            ? Localized.get.labelPeople(Formatter.resourceRaw(defenderLoses))
            : Localized.get.labelNone),
      ];
}
