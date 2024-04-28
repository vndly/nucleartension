import 'dart:ui';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/event_type.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/palette.dart';

class PlayerDefeated extends Event {
  final Player player;
  final Player killer;

  PlayerDefeated({
    required this.player,
    required this.killer,
  }) : super(eventType: EventType.player_defeated);

  @override
  bool get show => true;

  @override
  Color get titleColor => Palette.eventOther;

  @override
  List<String> get text => [
        Localized.get.eventPlayerDefeatedLine1(player.name, killer.name),
      ];
}
