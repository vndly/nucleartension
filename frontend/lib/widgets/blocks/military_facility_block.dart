import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/military_facility.dart';
import 'package:nucleartension/types/unit_type.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/blocks/building_container.dart';
import 'package:nucleartension/widgets/buttons/create_unit_button.dart';
import 'package:nucleartension/widgets/buttons/upgrade_building_button.dart';
import 'package:nucleartension/widgets/images/image_block.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class MilitaryFacilityBlock extends StatelessWidget {
  final MilitaryFacility militaryFacility;

  const MilitaryFacilityBlock(this.militaryFacility);

  @override
  Widget build(BuildContext context) {
    return BuildingContainer(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MilitaryFacilityLeftSection(militaryFacility),
              const Spacer(),
              MilitaryFacilityRightSection(militaryFacility),
            ],
          ),
          if (militaryFacility.level > 0) ...[
            const VBox(25),
            UnitSection(
              militaryFacility: militaryFacility,
              unitType: UnitType.infantry,
            ),
            const VBox(25),
            UnitSection(
              militaryFacility: militaryFacility,
              unitType: UnitType.vehicle,
            ),
            const VBox(25),
            UnitSection(
              militaryFacility: militaryFacility,
              unitType: UnitType.aircraft,
            ),
          ],
        ],
      ),
    );
  }
}

class MilitaryFacilityLeftSection extends StatelessWidget {
  final MilitaryFacility militaryFacility;

  const MilitaryFacilityLeftSection(this.militaryFacility);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildingImageBlock(
          building: militaryFacility,
          size: 70,
        ),
        const HBox(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Label(
              text: militaryFacility.buildingType.toString().toUpperCase(),
              color: Palette.textLight,
              weight: FontWeight.bold,
            ),
          ],
        ),
      ],
    );
  }
}

class MilitaryFacilityRightSection extends StatelessWidget {
  final MilitaryFacility militaryFacility;

  const MilitaryFacilityRightSection(this.militaryFacility);

  @override
  Widget build(BuildContext context) {
    return UpgradeBuildingButton(militaryFacility);
  }
}

class UnitSection extends StatelessWidget {
  final MilitaryFacility militaryFacility;
  final UnitType unitType;

  const UnitSection({
    required this.militaryFacility,
    required this.unitType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MissileLeftSection(
          militaryFacility: militaryFacility,
          unitType: unitType,
        ),
        const Spacer(),
        UnitRightSection(
          militaryFacility: militaryFacility,
          unitType: unitType,
        ),
      ],
    );
  }
}

class MissileLeftSection extends StatelessWidget {
  final MilitaryFacility militaryFacility;
  final UnitType unitType;

  const MissileLeftSection({
    required this.militaryFacility,
    required this.unitType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UnitImageBlock(
          unitType: unitType,
          size: 50,
        ),
        const HBox(15),
        Label(
          text: unitType.toString().toUpperCase(),
          color: Palette.textLight,
          weight: FontWeight.bold,
        ),
      ],
    );
  }
}

class UnitRightSection extends StatelessWidget {
  final MilitaryFacility militaryFacility;
  final UnitType unitType;

  const UnitRightSection({
    required this.militaryFacility,
    required this.unitType,
  });

  @override
  Widget build(BuildContext context) {
    return CreateUnitButton(
      player: militaryFacility.player,
      unitType: unitType,
    );
  }
}
