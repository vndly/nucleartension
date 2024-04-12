import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/event_type.dart';
import 'package:nucleartension/utils/formatter.dart';

class MissileAttackResultEvent extends Event {
  final Player attacker;
  final Player defender;
  final Player winner;
  final int totalMissiles;
  final int effectiveMissiles;
  final int ktPerMissile;
  final int defenderLoses;

  MissileAttackResultEvent({
    required this.attacker,
    required this.defender,
    required this.winner,
    required this.totalMissiles,
    required this.effectiveMissiles,
    required this.ktPerMissile,
    required this.defenderLoses,
  }) : super(eventType: EventType.unit_attack_result);

  @override
  List<String> get text => [
        'MISSILE ATTACK FINISHED',
        'Attacker: ${attacker.name}${(attacker == winner) ? ' (winner)' : ''}',
        'Defender: ${defender.name}${(defender == winner) ? ' (winner)' : ''}',
        'Total missiles: $totalMissiles (${Formatter.yield(totalMissiles * ktPerMissile)})',
        'Effective missiles: $effectiveMissiles (${Formatter.yield(effectiveMissiles * ktPerMissile)})',
        'Defender loses: ${Formatter.resourceRaw(defenderLoses)} people',
      ];
}
