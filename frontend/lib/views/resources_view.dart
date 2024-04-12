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
          HeaderBlock(game.self),
          const BlockSeparator(),
          ProducerBlock(game.self.powerPlant),
          const BlockSeparator(),
          ProducerBlock(game.self.supplyCenter),
          const BlockSeparator(),
          ProducerBlock(game.self.techLab),
          const BlockSeparator(),
          ProducerBlock(game.self.propagandaStation),
          const BlockSeparator(),
        ],
      ),
    );
  }
}
