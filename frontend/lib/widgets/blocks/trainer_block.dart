import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/dialog/information_dialog.dart';
import 'package:nucleartension/models/buildings/trainers/trainer.dart';
import 'package:nucleartension/models/requirement.dart';
import 'package:nucleartension/types/military_type.dart';
import 'package:nucleartension/types/research_type.dart';
import 'package:nucleartension/utils/environment.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/buttons/create_military_button.dart';
import 'package:nucleartension/widgets/buttons/upgrade_button.dart';
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
            for (final MilitaryType militaryType
                in trainer.buildingType.military) ...[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: RowSeparator(),
              ),
              ArmySection(
                trainer: trainer,
                militaryType: militaryType,
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
            label: '${Localized.get.labelLevel}:',
            text: trainer.level.toString(),
            labelColor: Palette.textPrimary,
            textColor: Palette.textPrimary,
            labelSize: 14,
            textSize: 14,
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
            text: Localized.get
                .labelQueue(trainer.queueSize, trainer.queueMaxCapacity),
            color:
                trainer.isQueueAvailable ? Palette.textPrimary : Palette.error,
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
    if (trainer.requirementFulfilled) {
      return UpgradeButton(
        upgradable: trainer,
        size: 70,
      );
    } else {
      return Label(
        text: Localized.get.labelRequiresBuilding(
          trainer.requirementType.localized.replaceAll(' ', '\n'),
          trainer.requirementMinLevel,
        ),
        color: Palette.error,
        align: TextAlign.center,
        size: 12,
      );
    }
  }
}

class ArmySection extends StatelessWidget {
  final Trainer trainer;
  final MilitaryType militaryType;

  const ArmySection({
    required this.trainer,
    required this.militaryType,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => InformationDialog.military(militaryType),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            LabeledInfo(
              title: militaryType.localized.toUpperCase(),
              onTap: () => InformationDialog.military(militaryType),
            ),
            const VBox(12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ArmyLeftSection(
                  trainer: trainer,
                  militaryType: militaryType,
                ),
                ArmyCenterSection(
                  trainer: trainer,
                  militaryType: militaryType,
                ),
                ArmyRightSection(
                  trainer: trainer,
                  militaryType: militaryType,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ArmyLeftSection extends StatelessWidget {
  final Trainer trainer;
  final MilitaryType militaryType;

  const ArmyLeftSection({
    required this.trainer,
    required this.militaryType,
  });

  @override
  Widget build(BuildContext context) {
    return MilitaryImageBlock(
      militaryType: militaryType,
      size: 50,
    );
  }
}

class ArmyCenterSection extends StatelessWidget {
  final Trainer trainer;
  final MilitaryType militaryType;

  const ArmyCenterSection({
    required this.trainer,
    required this.militaryType,
  });

  @override
  Widget build(BuildContext context) {
    if (trainer.enqueuedMilitary(militaryType) > 0) {
      final double gap = Environment.hasSmallScreen ? 0.15 : 0.07;

      return Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(),
            Label(
              text: trainer.enqueuedMilitary(militaryType).toString(),
              size: 14,
              color: Palette.textPrimary,
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
              task: trainer.firstTask(militaryType),
              cancellable: false,
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

class ArmyRightSection extends StatelessWidget {
  final Trainer trainer;
  final MilitaryType militaryType;

  const ArmyRightSection({
    required this.trainer,
    required this.militaryType,
  });

  @override
  Widget build(BuildContext context) {
    final Requirement<ResearchType> requirement = militaryType.requirement;

    if (requirement.fulfilled(trainer.player)) {
      return CreateMilitaryButton(
        trainer: trainer,
        militaryType: militaryType,
      );
    } else {
      return Label(
        text: Localized.get.labelRequiresResearch(
          requirement.type!.localized.replaceAll(' ', '\n'),
          requirement.minLevel,
        ),
        color: Palette.error,
        align: TextAlign.center,
        size: 12,
      );
    }
  }
}
