import 'package:flutter/material.dart';
import 'package:nucleartension/states/game_state.dart';
import 'package:nucleartension/widgets/blocks/header_block.dart';
import 'package:nucleartension/widgets/blocks/producer_block.dart';

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
          ProducerBlock(state.game.powerPlant),
          ProducerBlock(state.game.supplyCenter),
          ProducerBlock(state.game.propagandaStation),
          ProducerBlock(state.game.techLab),
        ],
      ),
    );
  }
}
