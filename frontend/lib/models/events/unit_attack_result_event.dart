import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/event_type.dart';

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
  List<String> get text {
    if (attacker.isSelf) {
      return [
        'Outgoing unit attack to ${defender.name} with military power of $militaryPower finished',
        'Winner: ${winner.name}',
        'Defender loses: $defenderLoses',
      ];
    } else if (defender.isSelf) {
      return [
        'Incoming unit attack from ${attacker.name} with military power of $militaryPower finished',
        'Winner: ${winner.name}',
        'Loses: $defenderLoses',
      ];
    } else {
      return [];
    }
  }
}
