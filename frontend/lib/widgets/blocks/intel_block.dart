import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/utils/formatter.dart';
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
        PlayersByTechnology(game),
      ],
    );
  }
}

class PlayersByPopulation extends StatelessWidget {
  final Game game;

  const PlayersByPopulation(this.game);

  @override
  Widget build(BuildContext context) {
    return PlayersList(
      title: 'POPULATION',
      players: game.playersByPopulation,
      function: (p) => Formatter.resourceRaw(p.population),
    );
  }
}

class PlayersByMilitary extends StatelessWidget {
  final Game game;

  const PlayersByMilitary(this.game);

  @override
  Widget build(BuildContext context) {
    return PlayersList(
      title: 'MILITARY',
      players: game.playersByMilitary,
      function: (p) => Formatter.resourceRaw(p.militaryPower),
    );
  }
}

class PlayersByTechnology extends StatelessWidget {
  final Game game;

  const PlayersByTechnology(this.game);

  @override
  Widget build(BuildContext context) {
    return PlayersList(
      title: 'TECHNOLOGY',
      players: game.playersByTechnology,
      function: (p) => Formatter.resourceRaw(p.technologyLevel),
    );
  }
}

class PlayersList extends StatelessWidget {
  final String title;
  final List<Player> players;
  final String Function(Player) function;

  const PlayersList({
    required this.title,
    required this.players,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlockTitle(title),
        for (int i = 0; i < players.length; i++) ...[
          if (players[i].isAlive)
            PlayerRow(
              player: players[i],
              value: function(players[i]),
            ),
          if (i < players.length - 1) const RowSeparator(),
        ],
        const BlockSeparator(),
      ],
    );
  }
}

class PlayerRow extends StatelessWidget {
  final Player player;
  final String value;

  const PlayerRow({
    required this.player,
    required this.value,
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
                    color: player.country.color,
                    weight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          const HBox(15),
          if (value.isNotEmpty)
            Label(
              text: value,
              color: player.country.color,
              weight: FontWeight.bold,
            ),
        ],
      ),
    );
  }
}
