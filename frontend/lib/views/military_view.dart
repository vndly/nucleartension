import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/widgets/blocks/header_block.dart';
import 'package:nucleartension/widgets/blocks/military_facility_block.dart';
import 'package:nucleartension/widgets/blocks/missile_silo_block.dart';
import 'package:nucleartension/widgets/separators/building_separator.dart';

class MilitaryView extends StatelessWidget {
  final Game game;

  const MilitaryView(this.game);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderBlock(game),
          const BuildingSeparator(),
          MissileSiloBlock(game.player.missileSilo),
          const BuildingSeparator(),
          MilitaryFacilityBlock(game.player.militaryFacility),
          const BuildingSeparator(),
        ],
      ),
    );
  }
}
