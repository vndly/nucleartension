import 'package:flutter/material.dart';
import 'package:nucleartension/states/game_state.dart';
import 'package:nucleartension/widgets/blocks/header_block.dart';
import 'package:nucleartension/widgets/blocks/town_center_block.dart';

class TownCenterView extends StatelessWidget {
  final GameState state;

  const TownCenterView(this.state);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderBlock(state),
        TownCenterBlock(state.colony.townCenter),
      ],
    );
  }
}
