import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/types/event_type.dart';

class DefconUpdateEvent extends Event {
  final int defconLevel;

  DefconUpdateEvent({
    required this.defconLevel,
  }) : super(eventType: EventType.defcon_update);

  @override
  List<String> get text => ['DEFCON $defconLevel'];
}
