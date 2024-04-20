import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/types/event_type.dart';

class DefconUpdateEvent extends Event {
  final int defconLevel;
  final num productionBoost;

  DefconUpdateEvent({
    required this.defconLevel,
    required this.productionBoost,
  }) : super(eventType: EventType.defcon_update);

  String get subtext {
    // TODO(momo): localize
    if (defconLevel == 4) {
      return 'A player has created a military unit';
    } else if (defconLevel == 3) {
      return 'A player has launched a unit attack';
    } else if (defconLevel == 2) {
      return 'A player has created an attack missile';
    } else if (defconLevel == 1) {
      return 'A player has launched a missile attack';
    } else {
      return '';
    }
  }

  @override
  // TODO(momo): localize
  List<String> get text => [
        'DEFCON $defconLevel',
        subtext,
        'Economy production boost increased to +${productionBoost.toInt()}%'
      ];
}
