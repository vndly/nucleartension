import 'package:flutter/material.dart';
import 'package:nucleartension/models/attacks/attack.dart';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/widgets/blocks/attack_block.dart';
import 'package:nucleartension/widgets/blocks/event_block.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class EventsView extends StatelessWidget {
  final Game game;

  const EventsView(this.game);

  @override
  Widget build(BuildContext context) {
    if (game.events.isEmpty) {
      return const Center(
        child: Label(text: 'NO EVENTS'),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final Attack attack in game.selfAttacks) AttackBlock(attack),
            for (final Event event in game.events) EventBlock(event),
          ],
        ),
      );
    }
  }
}
