import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/blocks/block_title.dart';
import 'package:nucleartension/widgets/images/image_asset.dart';
import 'package:nucleartension/widgets/labels/label.dart';
import 'package:nucleartension/widgets/separators/block_separator.dart';
import 'package:nucleartension/widgets/separators/row_separator.dart';

class IntelBlock extends StatelessWidget {
  final Game game;

  const IntelBlock(this.game);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PlayersByPopulation(game),
        PlayersByMilitary(game),
      ],
    );
  }
}

class PlayersByPopulation extends StatelessWidget {
  final Game game;

  const PlayersByPopulation(this.game);

  @override
  Widget build(BuildContext context) {
    final List<Player> players = game.playersByPopulation;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const BlockTitle('POPULATION'),
        for (int i = 0; i < players.length; i++) ...[
          PlayerRow(
            game: game,
            player: players[i],
          ),
          if (i < players.length - 1) const RowSeparator(),
        ],
        const BlockSeparator(),
      ],
    );
  }
}

class PlayersByMilitary extends StatelessWidget {
  final Game game;

  const PlayersByMilitary(this.game);

  @override
  Widget build(BuildContext context) {
    final List<Player> players = game.playersByMilitary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const BlockTitle('MILITARY'),
        for (int i = 0; i < players.length; i++) ...[
          PlayerRow(
            game: game,
            player: players[i],
          ),
          if (i < players.length - 1) const RowSeparator(),
        ],
        const BlockSeparator(),
      ],
    );
  }
}

class PlayerRow extends StatelessWidget {
  final Game game;
  final Player player;

  const PlayerRow({
    required this.game,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 15,
        right: 15,
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ImageAsset(
                    path: player.country.flag,
                    width: 21,
                    height: 14,
                  ),
                  const HBox(15),
                  Label(
                    text: player.name,
                    color: player.isAlive
                        ? player.country.color
                        : Palette.textDisabled,
                    weight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          const HBox(15),
          Label(
            text: Formatter.resourceRaw(player.population),
            color: player.isAlive ? player.country.color : Palette.textDisabled,
            weight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
