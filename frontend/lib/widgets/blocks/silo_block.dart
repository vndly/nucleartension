import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/silo.dart';
import 'package:nucleartension/types/unit_type.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/blocks/building_container.dart';
import 'package:nucleartension/widgets/buttons/create_unit_button.dart';
import 'package:nucleartension/widgets/buttons/upgrade_building_button.dart';
import 'package:nucleartension/widgets/images/image_block.dart';
import 'package:nucleartension/widgets/indicators/level_indicator.dart';
import 'package:nucleartension/widgets/labels/chip_text.dart';
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
          const VBox(25),
          MissilesSection(
            silo: silo,
            unitType: UnitType.missile_attack,
          ),
          const VBox(25),
          MissilesSection(
            silo: silo,
            unitType: UnitType.missile_defense,
          ),
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
            const VBox(12),
            LevelIndicator(silo),
            const VBox(12),
            const Label(
              text: 'CAPACITY: 10/20',
              color: Palette.text,
              weight: FontWeight.bold,
            ),
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

class MissilesSection extends StatelessWidget {
  final Silo silo;
  final UnitType unitType;

  const MissilesSection({
    required this.silo,
    required this.unitType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MissileLeftSection(
          silo: silo,
          unitType: unitType,
        ),
        const Spacer(),
        MissileRightSection(
          silo: silo,
          unitType: unitType,
        ),
      ],
    );
  }
}

class MissileLeftSection extends StatelessWidget {
  final Silo silo;
  final UnitType unitType;

  const MissileLeftSection({
    required this.silo,
    required this.unitType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageBlock(
          path: unitType.sprite,
          size: 50,
        ),
        const HBox(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Label(
              text: unitType.toString().toUpperCase(),
              color: Palette.text,
              weight: FontWeight.bold,
            ),
            const VBox(15),
            const ChipText(
              label: 'AMOUNT',
              text: '0',
            ),
          ],
        ),
      ],
    );
  }
}

class MissileRightSection extends StatelessWidget {
  final Silo silo;
  final UnitType unitType;

  const MissileRightSection({
    required this.silo,
    required this.unitType,
  });

  @override
  Widget build(BuildContext context) {
    return CreateUnitButton(
      game: silo.game,
      unitType: unitType,
    );
  }
}
