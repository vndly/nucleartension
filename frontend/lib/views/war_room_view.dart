import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/blocks/intel_block.dart';
import 'package:nucleartension/widgets/blocks/players_block.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class WarRoomView extends StatelessWidget {
  final MyGame game;

  const WarRoomView(this.game);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1 + (game.self.hasIntel ? 1 : 0),
      child: Column(
        children: [
          TabBar(
            labelPadding: EdgeInsets.zero,
            tabs: [
              TabTitle(Localized.get.screenWarRoomTabPlayers),
              if (game.self.hasIntel)
                TabTitle(Localized.get.screenWarRoomTabIntel),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                PlayersTab(game),
                if (game.self.hasIntel) IntelTab(game),
              ],
            ),
          ),
        ],
      ),
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
          color: Palette.textPrimary,
          weight: FontWeight.bold,
        ),
      ),
    );
  }
}

class PlayersTab extends StatelessWidget {
  final MyGame game;

  const PlayersTab(this.game);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PlayersBlock(game),
    );
  }
}

class IntelTab extends StatelessWidget {
  final MyGame game;

  const IntelTab(this.game);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: IntelBlock(game),
    );
  }
}
