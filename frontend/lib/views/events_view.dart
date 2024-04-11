import 'package:flutter/material.dart';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/widgets/blocks/event_block.dart';

class EventsView extends StatelessWidget {
  final Game game;

  const EventsView(this.game);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final Event event in game.events) ...[
            EventBlock(event),
          ],
        ],
      ),
    );
  }
}
