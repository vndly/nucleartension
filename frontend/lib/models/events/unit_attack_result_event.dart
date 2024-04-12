import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/event_type.dart';
import 'package:nucleartension/utils/formatter.dart';

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
        'UNIT ATTACK FINISHED',
        'Attacker: ${attacker.name}${(attacker == winner) ? ' (Winner)' : ''}',
        'Defender: ${defender.name}${(defender == winner) ? ' (Winner)' : ''}',
        'Power: $militaryPower',
        'Defender loses: ${Formatter.resource(defenderLoses)} people',
      ];
}
