import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/dialog/information_dialog.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/buttons/enabled_button.dart';
import 'package:nucleartension/widgets/images/image_asset.dart';
import 'package:nucleartension/widgets/labels/label.dart';
import 'package:nucleartension/widgets/separators/block_separator.dart';
import 'package:nucleartension/widgets/separators/row_separator.dart';

class PlayersBlock extends StatelessWidget {
  final Game game;

  const PlayersBlock(this.game);

  @override
  Widget build(BuildContext context) {
    final List<Player> players = game.playersByAlive;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
    if (player.isSelf || !player.isAlive) {
      return Container(
        color: player.isSelf ? Palette.backgroundRowSelf : Palette.transparent,
        child: PlayerRowContent(
          game: game,
          player: player,
        ),
      );
    } else {
      return Material(
        color: Palette.transparent,
        child: InkWell(
          onTap: () => InformationDialog.player(
            game: game,
            player: player,
          ),
          child: PlayerRowContent(
            game: game,
            player: player,
          ),
        ),
      );
    }
  }
}

class PlayerRowContent extends StatelessWidget {
  final Game game;
  final Player player;

  const PlayerRowContent({
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
                    grayscale: !player.isAlive,
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
          if (game.self.hasMilitaryPower && !player.isSelf && player.isAlive)
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: EnabledButton.attackMilitary(
                size: 30,
                onTap: () => game.onUnitAttack(
                  attacker: game.self,
                  defender: player,
                  militaryPower: game.self.militaryPower,
                ),
              ),
            ),
          if (game.self.hasAttackMissiles && !player.isSelf && player.isAlive)
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: EnabledButton.attackMissiles(
                size: 30,
                onTap: () => game.onMissileAttack(
                  attacker: game.self,
                  defender: player,
                  amount: game.self.militaryAttackMissiles,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
