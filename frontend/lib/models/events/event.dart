import 'package:nucleartension/types/event_type.dart';

class Event {
  final EventType eventType;
  final DateTime dateTime;
  bool seen = false;

  Event({
    required this.eventType,
  }) : dateTime = DateTime.now();

  void markAsSeen() {
    seen = true;
  }
}
