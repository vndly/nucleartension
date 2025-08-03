import 'dart:ui';
import 'package:nucleartension/domain/models/events/event.dart';
import 'package:nucleartension/domain/models/players/player.dart';
import 'package:nucleartension/domain/types/event_type.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/palette.dart';

class MissileAttackResultEvent extends Event {
  final Player attacker;
  final Player defender;
  final Player winner;
  final int totalMissiles;
  final int successfulAttackMissiles;
  final int ktPerMissile;
  final int casualties;

  MissileAttackResultEvent({
    required this.attacker,
    required this.defender,
    required this.winner,
    required this.totalMissiles,
    required this.successfulAttackMissiles,
    required this.ktPerMissile,
    required this.casualties,
  }) : super(eventType: EventType.missile_attack_result);

  @override
  bool get show => attacker.isSelf || defender.isSelf;

  @override
  Color get titleColor => attacker.isSelf
      ? Palette.eventAttackOutgoing
      : Palette.eventAttackIncoming;

  @override
  List<String> get text => [
    Localized.get.eventAttackMissileResultLine1,
    Localized.get.eventAttackMissileResultLine2(
      attacker.name,
      (attacker == winner) ? ' (${Localized.get.labelWinner})' : '',
    ),
    Localized.get.eventAttackMissileResultLine3(
      defender.name,
      (defender == winner) ? ' (${Localized.get.labelWinner})' : '',
    ),
    Localized.get.eventAttackMissileResultLine4(
      totalMissiles,
      Formatter.yield(totalMissiles * ktPerMissile),
    ),
    Localized.get.eventAttackMissileResultLine5(
      successfulAttackMissiles,
      (successfulAttackMissiles > 0)
          ? ' (${Formatter.yield(successfulAttackMissiles * ktPerMissile)})'
          : '',
    ),
    Localized.get.eventAttackMissileResultLine6(
      (casualties > 0)
          ? Localized.get.labelPeople(Formatter.resourceRaw(casualties))
          : Localized.get.labelNone,
    ),
  ];
}
