import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/silo.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/blocks/building_container.dart';
import 'package:nucleartension/widgets/buttons/upgrade_building_button.dart';
import 'package:nucleartension/widgets/images/image_block.dart';
import 'package:nucleartension/widgets/indicators/level_indicator.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class SiloBlock extends StatelessWidget {
  final Silo silo;

  const SiloBlock(this.silo);

  @override
  Widget build(BuildContext context) {
    return BuildingContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeftSection(silo),
          const Spacer(),
          RightSection(silo),
        ],
      ),
    );
  }
}

class LeftSection extends StatelessWidget {
  final Silo silo;

  const LeftSection(this.silo);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageBlock(
          path: silo.buildingType.sprite,
          size: 70,
        ),
        const HBox(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Label(
              text: silo.buildingType.toString().toUpperCase(),
              color: Palette.text,
              weight: FontWeight.bold,
            ),
            const VBox(10),
            LevelIndicator(silo),
          ],
        ),
      ],
    );
  }
}

class RightSection extends StatelessWidget {
  final Silo silo;

  const RightSection(this.silo);

  @override
  Widget build(BuildContext context) {
    return UpgradeBuildingButton(silo);
  }
}
