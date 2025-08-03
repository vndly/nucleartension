import 'package:flutter/material.dart';
import 'package:nucleartension/domain/models/events/event.dart';
import 'package:nucleartension/domain/models/game.dart';
import 'package:nucleartension/presentation/widgets/blocks/event_block.dart';
import 'package:nucleartension/presentation/widgets/labels/label.dart';
import 'package:nucleartension/utils/localizations.dart';

class EventsView extends StatelessWidget {
  final Game game;

  const EventsView(this.game);

  @override
  Widget build(BuildContext context) {
    final List<Event> events = game.visibleEvents;

    return events.isEmpty ? const NoEvents() : EventsList(events);
  }
}

class NoEvents extends StatelessWidget {
  const NoEvents();

  @override
  Widget build(BuildContext context) {
    return Center(child: Label(text: Localized.get.screenEventsNoEvents));
  }
}

class EventsList extends StatelessWidget {
  final List<Event> events;

  const EventsList(this.events);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [for (final Event event in events) EventBlock(event)],
      ),
    );
  }
}
