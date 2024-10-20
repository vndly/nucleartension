import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/widgets/blocks/producer_block.dart';
import 'package:nucleartension/widgets/separators/block_separator.dart';

class ResourcesView extends StatelessWidget {
  final MyGame game;

  const ResourcesView(this.game);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProducerBlock(game.self.powerPlant),
          const BlockSeparator(),
          ProducerBlock(game.self.propagandaStation),
          const BlockSeparator(),
        ],
      ),
    );
  }
}
