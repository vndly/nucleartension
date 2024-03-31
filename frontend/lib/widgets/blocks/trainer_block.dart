import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/trainers/trainer.dart';
import 'package:nucleartension/types/unit_type.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/blocks/building_container.dart';
import 'package:nucleartension/widgets/buttons/create_unit_button.dart';
import 'package:nucleartension/widgets/buttons/upgrade_building_button.dart';
import 'package:nucleartension/widgets/images/image_block.dart';
import 'package:nucleartension/widgets/indicators/task_progress_indicator.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class TrainerBlock extends StatelessWidget {
  final Trainer trainer;

  const TrainerBlock(this.trainer);

  @override
  Widget build(BuildContext context) {
    return BuildingContainer(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TrainerLeftSection(trainer),
              const Spacer(),
              TrainerRightSection(trainer),
            ],
          ),
          if (trainer.level > 0) ...[
            for (final UnitType unitType in trainer.buildingType.units)
              UnitSection(
                trainer: trainer,
                unitType: unitType,
              ),
          ],
        ],
      ),
    );
  }
}

class TrainerLeftSection extends StatelessWidget {
  final Trainer trainer;

  const TrainerLeftSection(this.trainer);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildingImageBlock(
          building: trainer,
          size: 70,
        ),
        const HBox(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Label(
              text: trainer.buildingType.toString().toUpperCase(),
              color: Palette.textLight,
              weight: FontWeight.bold,
            ),
            if (trainer.level > 0) ...[
              const VBox(12),
              Label(
                text: 'QUEUE: ${trainer.queueSize}/${trainer.queueMaxCapacity}',
                color: Palette.textLight,
                weight: FontWeight.bold,
              ),
            ],
          ],
        ),
      ],
    );
  }
}

class TrainerRightSection extends StatelessWidget {
  final Trainer trainer;

  const TrainerRightSection(this.trainer);

  @override
  Widget build(BuildContext context) {
    return UpgradeBuildingButton(trainer);
  }
}

class UnitSection extends StatelessWidget {
  final Trainer trainer;
  final UnitType unitType;

  const UnitSection({
    required this.trainer,
    required this.unitType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UnitLeftSection(
            trainer: trainer,
            unitType: unitType,
          ),
          const Spacer(),
          UnitCenterSection(
            trainer: trainer,
            unitType: unitType,
          ),
          const Spacer(),
          UnitRightSection(
            trainer: trainer,
            unitType: unitType,
          ),
        ],
      ),
    );
  }
}

class UnitLeftSection extends StatelessWidget {
  final Trainer trainer;
  final UnitType unitType;

  const UnitLeftSection({
    required this.trainer,
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

class UnitCenterSection extends StatelessWidget {
  final Trainer trainer;
  final UnitType unitType;

  const UnitCenterSection({
    required this.trainer,
    required this.unitType,
  });

  @override
  Widget build(BuildContext context) {
    if (trainer.enqueuedUnits(unitType) > 0) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Label(
            text: trainer.enqueuedUnits(unitType).toString(),
            size: 14,
            color: Palette.textLight,
          ),
          const HBox(4),
          const Icon(
            Icons.auto_awesome_motion,
            color: Palette.icon,
            size: 14,
          ),
          const HBox(10),
          TaskProgressIndicator(
            size: 50,
            task: trainer.firstTask(unitType),
          )
        ],
      );
    } else {
      return const Empty();
    }
  }
}

class UnitRightSection extends StatelessWidget {
  final Trainer trainer;
  final UnitType unitType;

  const UnitRightSection({
    required this.trainer,
    required this.unitType,
  });

  @override
  Widget build(BuildContext context) {
    return CreateUnitButton(
      trainer: trainer,
      unitType: unitType,
    );
  }
}
