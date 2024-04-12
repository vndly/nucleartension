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
  List<String> get text => [
        'UNIT ATTACK LAUNCHED',
        'Attacker: ${attacker.name}',
        'Defender: ${defender.name}',
        'Power: $militaryPower'
      ];
}
