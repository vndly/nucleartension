import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/dialog/information_dialog.dart';
import 'package:nucleartension/models/buildings/trainers/trainer.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/research_type.dart';
import 'package:nucleartension/types/unit_type.dart';
import 'package:nucleartension/utils/environment.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/buttons/create_unit_button.dart';
import 'package:nucleartension/widgets/buttons/upgrade_building_button.dart';
import 'package:nucleartension/widgets/images/image_block.dart';
import 'package:nucleartension/widgets/indicators/task_progress_indicator.dart';
import 'package:nucleartension/widgets/labels/label.dart';
import 'package:nucleartension/widgets/labels/labeled_info.dart';
import 'package:nucleartension/widgets/labels/labeled_text.dart';
import 'package:nucleartension/widgets/separators/row_separator.dart';

class TrainerBlock extends StatelessWidget {
  final Trainer trainer;

  const TrainerBlock(this.trainer);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Palette.backgroundRow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => InformationDialog.building(trainer.buildingType),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HeaderSection(trainer),
                  const VBox(12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TrainerLeftSection(trainer),
                      const Spacer(),
                      TrainerRightSection(trainer),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (trainer.level > 0) ...[
            for (final UnitType unitType in trainer.buildingType.units) ...[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: RowSeparator(),
              ),
              UnitSection(
                trainer: trainer,
                unitType: unitType,
              ),
            ]
          ],
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  final Trainer trainer;

  const HeaderSection(this.trainer);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LabeledInfo(
          title: trainer.buildingType.localized.toUpperCase(),
          onTap: () => InformationDialog.building(trainer.buildingType),
        ),
        if (trainer.level > 0) ...[
          const Spacer(),
          LabeledText(
            label: 'LEVEL:',
            text: trainer.level.toString(),
            labelColor: Palette.textMain,
            textColor: Palette.textMain,
            size: 14,
          ),
        ],
      ],
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BuildingImageBlock(
          building: trainer,
          size: 70,
        ),
        const HBox(15),
        if (trainer.level > 0)
          Label(
            text: 'QUEUE: ${trainer.queueSize}/${trainer.queueMaxCapacity}',
            color: trainer.isQueueAvailable ? Palette.textMain : Palette.error,
            weight: FontWeight.bold,
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
    return UpgradeButton(
      upgradable: trainer,
      size: 70,
    );
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
    return InkWell(
      onTap: () => InformationDialog.unit(unitType),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            LabeledInfo(
              title: unitType.localized.toUpperCase(),
              onTap: () => InformationDialog.unit(unitType),
            ),
            const VBox(12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UnitLeftSection(
                  trainer: trainer,
                  unitType: unitType,
                ),
                UnitCenterSection(
                  trainer: trainer,
                  unitType: unitType,
                ),
                UnitRightSection(
                  trainer: trainer,
                  unitType: unitType,
                ),
              ],
            ),
          ],
        ),
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
    return UnitImageBlock(
      unitType: unitType,
      size: 50,
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
      final double gap = Environment.hasSmallScreen ? 0.15 : 0.07;

      return Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(),
            Label(
              text: trainer.enqueuedUnits(unitType).toString(),
              size: 14,
              color: Palette.textMain,
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
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * gap,
            ),
          ],
        ),
      );
    } else {
      return const Spacer();
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
    if (unitType == UnitType.attack) {
      final Research research =
          trainer.player.getResearch(ResearchType.weapons_nuclear_bomb);

      if (research.level > 0) {
        return CreateUnitButton(
          trainer: trainer,
          unitType: unitType,
        );
      } else {
        return const Label(
          text: 'Requires\nnuclear bomb\nresearch',
          color: Palette.error,
          align: TextAlign.center,
          size: 12,
        );
      }
    } else {
      return CreateUnitButton(
        trainer: trainer,
        unitType: unitType,
      );
    }
  }
}
