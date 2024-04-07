import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/dialog/information_dialog.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/buttons/enabled_button.dart';
import 'package:nucleartension/widgets/images/image_asset.dart';
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
          PlayerRow(
            game: game,
            player: players[i],
          ),
          if (i < players.length - 1) const RowSeparator()
        ],
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
    return Material(
      color: Palette.transparent,
      child: InkWell(
        onTap: () => InformationDialog.player(player),
        child: Padding(
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
              if (game.player.hasMilitaryPower)
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: EnabledButton.attackMilitary(
                    size: 30,
                    onTap: () => game.onAttackPlayerMilitary(player),
                  ),
                ),
              if (game.player.hasAttackMissiles)
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: EnabledButton.attackMissiles(
                    size: 30,
                    onTap: () => game.onAttackPlayerMissiles(player),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
