import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/event_type.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/localizations.dart';

class UnitAttackLaunchEvent extends Event {
  final Player attacker;
  final Player defender;
  final int militaryPower;

  UnitAttackLaunchEvent({
    required this.attacker,
    required this.defender,
    required this.militaryPower,
  }) : super(eventType: EventType.unit_attack_launch);

  @override
  List<String> get text => [
        Localized.get.eventAttackUnitLaunchLine1,
        Localized.get.eventAttackUnitLaunchLine2(attacker.name),
        Localized.get.eventAttackUnitLaunchLine3(defender.name),
        Localized.get
            .eventAttackUnitLaunchLine4(Formatter.resourceRaw(militaryPower)),
      ];
}
