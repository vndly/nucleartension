import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';
import 'package:nucleartension/widgets/separators/row_separator.dart';

class PlayersBlock extends StatelessWidget {
  final Game game;

  const PlayersBlock(this.game);

  @override
  Widget build(BuildContext context) {
    final List<Player> players = game.otherPlayers;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < players.length; i++) ...[
          PlayerRow(players[i]),
          if (i < players.length - 1) const RowSeparator()
        ],
      ],
    );
  }
}

class PlayerRow extends StatelessWidget {
  final Player player;

  const PlayerRow(this.player);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Label(
            text: player.name,
            color: Palette.textLight,
            size: 16,
            weight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
