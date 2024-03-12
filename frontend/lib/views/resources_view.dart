import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/producers/producer.dart';
import 'package:nucleartension/models/colony.dart';
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
            colony: state.colony,
            buildingType: BuildingType.power_plant,
            producers: state.colony.producers,
          ),
          ProducerList(
            colony: state.colony,
            buildingType: BuildingType.supply_center,
            producers: state.colony.producers,
          ),
          ProducerList(
            colony: state.colony,
            buildingType: BuildingType.propaganda_station,
            producers: state.colony.producers,
          ),
          ProducerList(
            colony: state.colony,
            buildingType: BuildingType.tech_lab,
            producers: state.colony.producers,
          ),
        ],
      ),
    );
  }
}

class ProducerList extends StatelessWidget {
  final Colony colony;
  final BuildingType buildingType;
  final List<Producer> producers;

  const ProducerList({
    required this.colony,
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
