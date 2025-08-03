import 'dart:ui';
import 'package:nucleartension/domain/types/event_type.dart';

abstract class Event {
  final EventType eventType;
  final DateTime dateTime;
  bool seen = false;

  Event({required this.eventType}) : dateTime = DateTime.now();

  void markAsSeen() {
    seen = true;
  }

  Color get titleColor;

  List<String> get text;

  bool get show;
}
