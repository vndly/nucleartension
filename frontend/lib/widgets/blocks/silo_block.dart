import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/silo.dart';
import 'package:nucleartension/types/missile_type.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/blocks/building_container.dart';
import 'package:nucleartension/widgets/buttons/create_unit_button.dart';
import 'package:nucleartension/widgets/buttons/upgrade_building_button.dart';
import 'package:nucleartension/widgets/images/image_block.dart';
import 'package:nucleartension/widgets/indicators/cost_indicator.dart';
import 'package:nucleartension/widgets/indicators/level_indicator.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class SiloBlock extends StatelessWidget {
  final Silo silo;

  const SiloBlock(this.silo);

  @override
  Widget build(BuildContext context) {
    return BuildingContainer(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SiloLeftSection(silo),
              const Spacer(),
              SiloRightSection(silo),
            ],
          ),
          const VBox(20),
          AttackMissilesSection(silo),
        ],
      ),
    );
  }
}

class SiloLeftSection extends StatelessWidget {
  final Silo silo;

  const SiloLeftSection(this.silo);

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

class SiloRightSection extends StatelessWidget {
  final Silo silo;

  const SiloRightSection(this.silo);

  @override
  Widget build(BuildContext context) {
    return UpgradeBuildingButton(silo);
  }
}

class AttackMissilesSection extends StatelessWidget {
  final Silo silo;

  const AttackMissilesSection(this.silo);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AttackMissileLeftSection(silo),
        const Spacer(),
        AttackMissileRightSection(silo),
      ],
    );
  }
}

class AttackMissileLeftSection extends StatelessWidget {
  final Silo silo;

  const AttackMissileLeftSection(this.silo);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageBlock(
          path: MissileType.attack.sprite,
          size: 50,
        ),
        const HBox(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Label(
              text: 'ATTACK MISSILES',
              color: Palette.text,
              weight: FontWeight.bold,
            ),
            const VBox(5),
            CostIndicator(
              game: silo.game,
              cost: MissileType.attack.cost,
            ),
          ],
        ),
      ],
    );
  }
}

class AttackMissileRightSection extends StatelessWidget {
  final Silo silo;

  const AttackMissileRightSection(this.silo);

  @override
  Widget build(BuildContext context) {
    return CreateUnitButton(
      game: silo.game,
      unitType: MissileType.attack,
    );
  }
}
