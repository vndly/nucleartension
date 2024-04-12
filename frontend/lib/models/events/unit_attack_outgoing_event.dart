import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/event_type.dart';

class UnitAttackOutgoingEvent extends Event {
  final Player defender;
  final int militaryPower;

  UnitAttackOutgoingEvent({
    required this.defender,
    required this.militaryPower,
  }) : super(eventType: EventType.unit_attack_outgoing);

  @override
  String toString() =>
      'Outgoing unit attack to ${defender.name} with military power of $militaryPower';
}
