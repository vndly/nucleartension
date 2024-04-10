import 'package:flutter/material.dart';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/blocks/event_block.dart';
import 'package:nucleartension/widgets/blocks/header_block.dart';
import 'package:nucleartension/widgets/blocks/players_block.dart';
import 'package:nucleartension/widgets/labels/label.dart';
import 'package:nucleartension/widgets/separators/block_separator.dart';

class WarRoomView extends StatelessWidget {
  final Game game;

  const WarRoomView(this.game);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderBlock(game.player),
        const BlockSeparator(),
        DefaultTabController(
          length: 3,
          child: Expanded(
            child: Column(
              children: [
                const TabBar(
                  labelPadding: EdgeInsets.zero,
                  tabs: [
                    TabTitle('PLAYERS'),
                    TabTitle('EVENTS'),
                    TabTitle('INTEL'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      PlayersTab(game),
                      EventsTab(game),
                      IntelTab(game),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TabTitle extends StatelessWidget {
  final String title;

  const TabTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Palette.backgroundTitle,
      child: Tab(
        child: Label(
          text: title,
          color: Palette.textMain,
          weight: FontWeight.bold,
        ),
      ),
    );
  }
}

class PlayersTab extends StatelessWidget {
  final Game game;

  const PlayersTab(this.game);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlayersBlock(game),
          const BlockSeparator(),
        ],
      ),
    );
  }
}

class EventsTab extends StatelessWidget {
  final Game game;

  const EventsTab(this.game);

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

class IntelTab extends StatelessWidget {
  final Game game;

  const IntelTab(this.game);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Label(text: 'INTEL'),
          ),
        ],
      ),
    );
  }
}
