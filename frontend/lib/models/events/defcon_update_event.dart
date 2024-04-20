import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/types/event_type.dart';
import 'package:nucleartension/utils/localizations.dart';

class DefconUpdateEvent extends Event {
  final int defconLevel;
  final num productionBoost;

  DefconUpdateEvent({
    required this.defconLevel,
    required this.productionBoost,
  }) : super(eventType: EventType.defcon_update);

  String get subtext {
    if (defconLevel == 4) {
      return Localized.get.eventDefconLine2Level4;
    } else if (defconLevel == 3) {
      return Localized.get.eventDefconLine2Level3;
    } else if (defconLevel == 2) {
      return Localized.get.eventDefconLine2Level2;
    } else if (defconLevel == 1) {
      return Localized.get.eventDefconLine2Level1;
    } else {
      return '';
    }
  }

  @override
  List<String> get text => [
        Localized.get.eventDefconLine1(defconLevel),
        subtext,
        Localized.get.eventDefconLine3(productionBoost.toInt()),
      ];
}
