import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/producers/producer.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/blocks/building_container.dart';
import 'package:nucleartension/widgets/buttons/upgrade_building_button.dart';
import 'package:nucleartension/widgets/images/image_block.dart';
import 'package:nucleartension/widgets/indicators/level_indicator.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class ProducerBlock extends StatelessWidget {
  final Producer producer;

  const ProducerBlock(this.producer);

  @override
  Widget build(BuildContext context) {
    return BuildingContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeftSection(producer),
          const Spacer(),
          RightSection(producer),
        ],
      ),
    );
  }
}

class LeftSection extends StatelessWidget {
  final Producer producer;

  const LeftSection(this.producer);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageBlock(
          path: producer.buildingType.sprite,
          size: 70,
        ),
        const HBox(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Label(
              text: producer.buildingType.toString().toUpperCase(),
              color: Palette.text,
              weight: FontWeight.bold,
            ),
            const VBox(10),
            ProductionIndicator(producer),
            const VBox(10),
            LevelIndicator(producer),
          ],
        ),
      ],
    );
  }
}

class RightSection extends StatelessWidget {
  final Producer producer;

  const RightSection(this.producer);

  @override
  Widget build(BuildContext context) {
    return UpgradeBuildingButton(producer);
  }
}

class ProductionIndicator extends StatelessWidget {
  final Producer producer;

  const ProductionIndicator(this.producer);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        producer.resourceType.icon(15),
        const HBox(10),
        Label(
          text: '${Formatter.production(producer.production)}/s',
          color: (producer.production == 0) ? Palette.error : Palette.text,
          size: 15,
        ),
      ],
    );
  }
}
