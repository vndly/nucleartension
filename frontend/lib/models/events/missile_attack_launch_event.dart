import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/event_type.dart';
import 'package:nucleartension/utils/formatter.dart';

class MissileAttackLaunchEvent extends Event {
  final Player attacker;
  final Player defender;
  final int totalMissiles;
  final int ktPerMissile;

  MissileAttackLaunchEvent({
    required this.attacker,
    required this.defender,
    required this.totalMissiles,
    required this.ktPerMissile,
  }) : super(eventType: EventType.missile_attack_launch);

  @override
  List<String> get text => [
        'MISSILE ATTACK LAUNCHED',
        'Attacker: ${attacker.name}',
        'Defender: ${defender.name}',
        'Amount: $totalMissiles (${Formatter.yield(totalMissiles * ktPerMissile)})',
      ];
}
