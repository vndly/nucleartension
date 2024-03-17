import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/producers/producer.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/states/game_state.dart';
import 'package:nucleartension/types/building_type.dart';
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
          ProducerList(
            game: state.game,
            buildingType: BuildingType.power_plant,
            producers: state.game.producers,
          ),
          ProducerList(
            game: state.game,
            buildingType: BuildingType.supply_center,
            producers: state.game.producers,
          ),
          ProducerList(
            game: state.game,
            buildingType: BuildingType.propaganda_station,
            producers: state.game.producers,
          ),
          ProducerList(
            game: state.game,
            buildingType: BuildingType.tech_lab,
            producers: state.game.producers,
          ),
        ],
      ),
    );
  }
}

class ProducerList extends StatelessWidget {
  final Game game;
  final BuildingType buildingType;
  final List<Producer> producers;

  const ProducerList({
    required this.game,
    required this.buildingType,
    required this.producers,
  });

  @override
  Widget build(BuildContext context) {
    final List<Producer> list =
        producers.where((e) => e.buildingType == buildingType).toList();

    return Column(
      children: [
        for (final Producer producer in list) ProducerBlock(producer),
      ],
    );
  }
}
