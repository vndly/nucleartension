import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/event_type.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/localizations.dart';

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
  bool get show => attacker.isSelf || defender.isSelf;

  @override
  List<String> get text => [
        Localized.get.eventAttackMissileLaunchLine1,
        Localized.get.eventAttackMissileLaunchLine2(attacker.name),
        Localized.get.eventAttackMissileLaunchLine3(defender.name),
        Localized.get.eventAttackMissileLaunchLine4(
            totalMissiles, Formatter.yield(totalMissiles * ktPerMissile)),
      ];
}
