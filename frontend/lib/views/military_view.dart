import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/widgets/blocks/header_block.dart';
import 'package:nucleartension/widgets/blocks/trainer_block.dart';
import 'package:nucleartension/widgets/separators/block_separator.dart';

class MilitaryView extends StatelessWidget {
  final Game game;

  const MilitaryView(this.game);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderBlock(game.self),
          const BlockSeparator(),
          TrainerBlock(game.self.militaryFacility),
          const BlockSeparator(),
          TrainerBlock(game.self.missileSilo),
          const BlockSeparator(),
        ],
      ),
    );
  }
}
