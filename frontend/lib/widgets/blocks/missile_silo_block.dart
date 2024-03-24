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
import 'package:nucleartension/widgets/labels/label.dart';

class MissileSiloBlock extends StatelessWidget {
  final MissileSilo missileSilo;

  const MissileSiloBlock(this.missileSilo);

  @override
  Widget build(BuildContext context) {
    return BuildingContainer(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SiloLeftSection(missileSilo),
              const Spacer(),
              SiloRightSection(missileSilo),
            ],
          ),
          const VBox(25),
          MissilesSection(
            missileSilo: missileSilo,
            unitType: UnitType.missile_attack,
          ),
          const VBox(25),
          MissilesSection(
            missileSilo: missileSilo,
            unitType: UnitType.missile_defense,
          ),
        ],
      ),
    );
  }
}

class SiloLeftSection extends StatelessWidget {
  final MissileSilo missileSilo;

  const SiloLeftSection(this.missileSilo);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageBlock(
          path: missileSilo.buildingType.sprite,
          size: 70,
        ),
        const HBox(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Label(
              text: missileSilo.buildingType.toString().toUpperCase(),
              color: Palette.text,
              weight: FontWeight.bold,
            ),
            const VBox(12),
            LevelIndicator(missileSilo),
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
  final MissileSilo missileSilo;

  const SiloRightSection(this.missileSilo);

  @override
  Widget build(BuildContext context) {
    return UpgradeBuildingButton(missileSilo);
  }
}

class MissilesSection extends StatelessWidget {
  final MissileSilo missileSilo;
  final UnitType unitType;

  const MissilesSection({
    required this.missileSilo,
    required this.unitType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MissileLeftSection(
          missileSilo: missileSilo,
          unitType: unitType,
        ),
        const Spacer(),
        MissileRightSection(
          missileSilo: missileSilo,
          unitType: unitType,
        ),
      ],
    );
  }
}

class MissileLeftSection extends StatelessWidget {
  final MissileSilo missileSilo;
  final UnitType unitType;

  const MissileLeftSection({
    required this.missileSilo,
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
        Label(
          text: unitType.toString().toUpperCase(),
          color: Palette.text,
          weight: FontWeight.bold,
        ),
      ],
    );
  }
}

class MissileRightSection extends StatelessWidget {
  final MissileSilo missileSilo;
  final UnitType unitType;

  const MissileRightSection({
    required this.missileSilo,
    required this.unitType,
  });

  @override
  Widget build(BuildContext context) {
    return CreateUnitButton(
      game: missileSilo.game,
      unitType: unitType,
    );
  }
}
