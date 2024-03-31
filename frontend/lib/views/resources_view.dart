import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/widgets/blocks/header_block.dart';
import 'package:nucleartension/widgets/blocks/producer_block.dart';
import 'package:nucleartension/widgets/separators/block_separator.dart';

class ResourcesView extends StatelessWidget {
  final Game game;

  const ResourcesView(this.game);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderBlock(game.player),
          const BlockSeparator(),
          ProducerBlock(game.player.powerPlant),
          const BlockSeparator(),
          ProducerBlock(game.player.supplyCenter),
          const BlockSeparator(),
          ProducerBlock(game.player.techLab),
          const BlockSeparator(),
          ProducerBlock(game.player.propagandaStation),
          const BlockSeparator(),
        ],
      ),
    );
  }
}
