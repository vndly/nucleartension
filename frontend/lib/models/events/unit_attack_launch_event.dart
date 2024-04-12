import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/event_type.dart';

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
  List<String> get text {
    if (attacker.isSelf) {
      return [
        'Outgoing unit attack to ${defender.name} with military power of $militaryPower'
      ];
    } else if (defender.isSelf) {
      return [
        'Incoming unit attack from ${attacker.name} with military power of $militaryPower'
      ];
    } else {
      return [];
    }
  }
}
