import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/research_type.dart';
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
    if (game.self.hasIntel) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PlayersByPopulation(game),
          PlayersByMilitary(game),
          PlayersByTechnology(game),
        ],
      );
    } else {
      return const Empty();
    }
  }
}

class PlayersByPopulation extends StatelessWidget {
  final Game game;

  const PlayersByPopulation(this.game);

  @override
  Widget build(BuildContext context) {
    final Research research = game.self.getResearch(ResearchType.intel_economy);

    return PlayersList(
      title: 'POPULATION',
      players: game.playersByPopulation,
      researchLevel: research.level,
      function: (p) => Formatter.resourceRaw(p.population),
    );
  }
}

class PlayersByMilitary extends StatelessWidget {
  final Game game;

  const PlayersByMilitary(this.game);

  @override
  Widget build(BuildContext context) {
    final Research research =
        game.self.getResearch(ResearchType.intel_military);

    return PlayersList(
      title: 'MILITARY',
      players: game.playersByMilitary,
      researchLevel: research.level,
      function: (p) => Formatter.resourceRaw(p.militaryPower),
    );
  }
}

class PlayersByTechnology extends StatelessWidget {
  final Game game;

  const PlayersByTechnology(this.game);

  @override
  Widget build(BuildContext context) {
    final Research research =
        game.self.getResearch(ResearchType.intel_technology);

    return PlayersList(
      title: 'TECHNOLOGY',
      players: game.playersByTechnology,
      researchLevel: research.level,
      function: (p) => Formatter.resourceRaw(p.technologyLevel),
    );
  }
}

class PlayersList extends StatelessWidget {
  final String title;
  final List<Player> players;
  final int researchLevel;
  final String Function(Player) function;

  const PlayersList({
    required this.title,
    required this.players,
    required this.researchLevel,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    if (researchLevel > 0) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlockTitle(title),
          for (int i = 0; i < players.length; i++) ...[
            if (players[i].isAlive)
              PlayerRow(
                player: players[i],
                value: (researchLevel > 1) ? function(players[i]) : '',
              ),
            if (i < players.length - 1) const RowSeparator(),
          ],
          const BlockSeparator(),
        ],
      );
    } else {
      return const Empty();
    }
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
