import 'package:flutter/material.dart';
import 'package:nucleartension/states/game_state.dart';
import 'package:nucleartension/widgets/blocks/header_block.dart';
import 'package:nucleartension/widgets/blocks/producer_block.dart';
import 'package:nucleartension/widgets/separators/building_separator.dart';

class ResourcesView extends StatelessWidget {
  final GameState state;

  const ResourcesView(this.state);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderBlock(state),
          const BuildingSeparator(),
          ProducerBlock(state.game.powerPlant),
          const BuildingSeparator(),
          ProducerBlock(state.game.supplyCenter),
          const BuildingSeparator(),
          ProducerBlock(state.game.propagandaStation),
          const BuildingSeparator(),
          ProducerBlock(state.game.techLab),
          const BuildingSeparator(),
        ],
      ),
    );
  }
}
