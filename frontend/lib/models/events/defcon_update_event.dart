import 'dart:ui';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/event_type.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/palette.dart';

class DefconUpdateEvent extends Event {
  final Player player;
  final int defconLevel;
  final num productionBoost;

  DefconUpdateEvent({
    required this.player,
    required this.defconLevel,
    required this.productionBoost,
  }) : super(eventType: EventType.defcon_update);

  @override
  bool get show => true;

  String get subtext {
    if (defconLevel == 4) {
      return player.isSelf
          ? Localized.get.eventDefconLine2Level4Self
          : Localized.get.eventDefconLine2Level4Other;
    } else if (defconLevel == 3) {
      return player.isSelf
          ? Localized.get.eventDefconLine2Level3Self
          : Localized.get.eventDefconLine2Level3Other;
    } else if (defconLevel == 2) {
      return player.isSelf
          ? Localized.get.eventDefconLine2Level2Self
          : Localized.get.eventDefconLine2Level2Other;
    } else if (defconLevel == 1) {
      return player.isSelf
          ? Localized.get.eventDefconLine2Level1Self
          : Localized.get.eventDefconLine2Level1Other;
    } else {
      return '';
    }
  }

  @override
  Color get titleColor => Palette.eventOther;

  @override
  List<String> get text => [
    Localized.get.eventDefconLine1(defconLevel),
    subtext,
    Localized.get.eventDefconLine3(productionBoost.toInt()),
  ];
}
