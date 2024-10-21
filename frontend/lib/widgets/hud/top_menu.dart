import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class TopMenu extends StatelessWidget {
  final Game game;

  const TopMenu(this.game);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.bolt,
            color: Palette.resourceEnergy,
            size: 14,
          ),
          const HBox(10),
          Label(
            text: Formatter.resource(game.self.energy),
            color: Palette.textPrimary,
            size: 14,
          ),
        ],
      ),
    );
  }
}
