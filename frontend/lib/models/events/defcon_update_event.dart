import 'package:nucleartension/models/events/event.dart';

class DefconUpdateEvent extends Event {
  final int defconLevel;

  DefconUpdateEvent({
    required super.eventType,
    required this.defconLevel,
  });

  @override
  String toString() => 'DEFCON $defconLevel';
}
