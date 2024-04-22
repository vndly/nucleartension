import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/dialog/information_dialog.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/buttons/disabled_button.dart';
import 'package:nucleartension/widgets/buttons/upgrade_button.dart';
import 'package:nucleartension/widgets/images/image_block.dart';
import 'package:nucleartension/widgets/labels/label.dart';
import 'package:nucleartension/widgets/labels/labeled_info.dart';
import 'package:nucleartension/widgets/labels/labeled_text.dart';

class ResearchBlock extends StatelessWidget {
  final Player player;
  final Research research;

  const ResearchBlock({
    required this.player,
    required this.research,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Palette.backgroundRow,
      child: InkWell(
        onTap: () => InformationDialog.research(research.researchType),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              HeaderSection(research),
              const VBox(12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LeftSection(research),
                  const HBox(20),
                  RightSection(
                    player: player,
                    research: research,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  final Research research;

  const HeaderSection(this.research);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LabeledInfo(
          title: research.researchType.localized.toUpperCase(),
          onTap: () => InformationDialog.research(research.researchType),
        ),
        if (research.level > 0) ...[
          const Spacer(),
          LabeledText(
            label: '${Localized.get.labelLevel}:',
            text: research.level.toString(),
            labelColor: Palette.textPrimary,
            textColor: Palette.textPrimary,
            size: 14,
          ),
        ],
      ],
    );
  }
}

class LeftSection extends StatelessWidget {
  final Research research;

  const LeftSection(this.research);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResearchImageBlock(
            research: research,
            size: 50,
          ),
          const HBox(10),
          Expanded(
            child: SizedBox(
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Label(
                    text: research.researchType.description,
                    color: Palette.textDescription,
                    size: 12,
                    uppercase: false,
                  ),
                  if (research.level > 0) ...[
                    const Spacer(),
                    LabeledText(
                      label: '${Localized.get.labelCurrent}:',
                      text:
                          research.researchType.rateDescription(research.level),
                      labelColor: Palette.textDescription,
                      textColor: Palette.textDescription,
                      size: 12,
                      uppercase: false,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RightSection extends StatelessWidget {
  final Player player;
  final Research research;

  const RightSection({
    required this.player,
    required this.research,
  });

  @override
  Widget build(BuildContext context) {
    final BuildingType? buildingType = research.buildingType;
    final int buildingLevel =
        (buildingType != null) ? player.getBuilding(buildingType).level : 1;

    if (buildingLevel > 0) {
      if (research.isMax) {
        return DisabledButton.text(
          text: Localized.get.labelMax,
          size: 50,
        );
      } else {
        return UpgradeButton(
          upgradable: research,
          size: 50,
        );
      }
    } else {
      return Label(
        text: Localized.get
            .labelRequiresBuilding(buildingType!.localized)
            .replaceAll(' ', '\n'),
        color: Palette.error,
        align: TextAlign.center,
        size: 12,
      );
    }
  }
}
