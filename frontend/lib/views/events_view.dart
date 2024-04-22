import 'package:flutter/material.dart';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/widgets/blocks/event_block.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class EventsView extends StatelessWidget {
  final Game game;

  const EventsView(this.game);

  @override
  Widget build(BuildContext context) {
    final List<Event> events = game.visibleEvents;

    if (events.isEmpty) {
      return Center(
        child: Label(text: Localized.get.screenEventsNoEvents),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final Event event in events) EventBlock(event),
          ],
        ),
      );
    }
  }
}
