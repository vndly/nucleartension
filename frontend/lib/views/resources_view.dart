import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/widgets/blocks/producer_block.dart';
import 'package:nucleartension/widgets/separators/block_separator.dart';

class ResourcesView extends StatelessWidget {
  final Game game;

  const ResourcesView(this.game);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProducerBlock(game.self.powerPlant),
            const BlockSeparator(),
            ProducerBlock(game.self.supplyCenter),
            if (game.self.powerPlant.level > 0) ...[
              const BlockSeparator(),
              ProducerBlock(game.self.techLab),
            ],
            if (game.self.supplyCenter.level > 0) ...[
              const BlockSeparator(),
              ProducerBlock(game.self.propagandaStation),
            ],
            const BlockSeparator(),
          ],
        ),
      ),
    );
  }
}
