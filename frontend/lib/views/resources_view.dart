import 'package:flutter/material.dart';
import 'package:nucleartension/models/base.dart';
import 'package:nucleartension/models/buildings/producers/producer.dart';
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
            base: state.base,
            buildingType: BuildingType.power_plant,
            producers: state.base.producers,
          ),
          ProducerList(
            base: state.base,
            buildingType: BuildingType.supply_center,
            producers: state.base.producers,
          ),
          ProducerList(
            base: state.base,
            buildingType: BuildingType.propaganda_station,
            producers: state.base.producers,
          ),
          ProducerList(
            base: state.base,
            buildingType: BuildingType.tech_lab,
            producers: state.base.producers,
          ),
        ],
      ),
    );
  }
}

class ProducerList extends StatelessWidget {
  final Base base;
  final BuildingType buildingType;
  final List<Producer> producers;

  const ProducerList({
    required this.base,
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
