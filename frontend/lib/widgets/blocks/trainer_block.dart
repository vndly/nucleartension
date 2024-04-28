import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/dialog/information_dialog.dart';
import 'package:nucleartension/models/buildings/trainers/trainer.dart';
import 'package:nucleartension/models/research.dart';
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
              CombatForcesSection(
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
    return UpgradeButton(
      upgradable: trainer,
      size: 70,
    );
  }
}

class CombatForcesSection extends StatelessWidget {
  final Trainer trainer;
  final MilitaryType militaryType;

  const CombatForcesSection({
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
                CombatForcesLeftSection(
                  trainer: trainer,
                  militaryType: militaryType,
                ),
                CombatForcesCenterSection(
                  trainer: trainer,
                  militaryType: militaryType,
                ),
                CombatForcesRightSection(
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

class CombatForcesLeftSection extends StatelessWidget {
  final Trainer trainer;
  final MilitaryType militaryType;

  const CombatForcesLeftSection({
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

class CombatForcesCenterSection extends StatelessWidget {
  final Trainer trainer;
  final MilitaryType militaryType;

  const CombatForcesCenterSection({
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

class CombatForcesRightSection extends StatelessWidget {
  final Trainer trainer;
  final MilitaryType militaryType;

  const CombatForcesRightSection({
    required this.trainer,
    required this.militaryType,
  });

  @override
  Widget build(BuildContext context) {
    if (militaryType == MilitaryType.missile_attack) {
      final Research research =
          trainer.player.getResearch(ResearchType.missiles_nuclear_bomb);

      if (research.level > 0) {
        return CreateMilitaryButton(
          trainer: trainer,
          militaryType: militaryType,
        );
      } else {
        return Label(
          text: Localized.get
              .labelRequiresResearch(
                  ResearchType.missiles_nuclear_bomb.localized)
              .replaceAll(' ', '\n'),
          color: Palette.error,
          align: TextAlign.center,
          size: 12,
        );
      }
    } else {
      return CreateMilitaryButton(
        trainer: trainer,
        militaryType: militaryType,
      );
    }
  }
}
