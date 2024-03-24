import 'package:flutter/material.dart';
import 'package:nucleartension/states/game_state.dart';
import 'package:nucleartension/widgets/blocks/header_block.dart';
import 'package:nucleartension/widgets/blocks/military_facility_block.dart';
import 'package:nucleartension/widgets/blocks/missile_silo_block.dart';

class MilitaryView extends StatelessWidget {
  final GameState state;

  const MilitaryView(this.state);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderBlock(state),
          MissileSiloBlock(state.game.missileSilo),
          MilitaryFacilityBlock(state.game.militaryFacility),
        ],
      ),
    );
  }
}
