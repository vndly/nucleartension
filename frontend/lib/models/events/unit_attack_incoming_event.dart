import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/event_type.dart';

class UnitAttackIncomingEvent extends Event {
  final Player attacker;
  final int militaryPower;

  UnitAttackIncomingEvent({
    required this.attacker,
    required this.militaryPower,
  }) : super(eventType: EventType.unit_attack_incoming);

  @override
  String toString() =>
      'Incoming unit attack from ${attacker.name} with military power of $militaryPower';
}
