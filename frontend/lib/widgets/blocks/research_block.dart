import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nucleartension/dialog/information_dialog.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/blocks/building_container.dart';
import 'package:nucleartension/widgets/buttons/upgrade_building_button.dart';
import 'package:nucleartension/widgets/images/image_block.dart';
import 'package:nucleartension/widgets/labels/labeled_info.dart';
import 'package:nucleartension/widgets/labels/labeled_text.dart';

class ResearchBlock extends StatelessWidget {
  final Research research;

  const ResearchBlock(this.research);

  @override
  Widget build(BuildContext context) {
    return BuildingContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              LabeledInfo(
                title: research.researchType.localized.toUpperCase(),
                onTap: () => InformationDialog.research(research.researchType),
              ),
              if (research.level > 0) ...[
                const Spacer(),
                LabeledText(
                  label: 'LEVEL:',
                  text: research.level.toString(),
                  labelColor: Palette.textLight,
                  textColor: Palette.textLight,
                  size: 14,
                ),
              ],
            ],
          ),
          const VBox(12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LeftSection(research),
              const Spacer(),
              RightSection(research),
            ],
          ),
        ],
      ),
    );
  }
}

class LeftSection extends StatelessWidget {
  final Research research;

  const LeftSection(this.research);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ResearchImageBlock(
          research: research,
          size: 70,
        ),
      ],
    );
  }
}

class RightSection extends StatelessWidget {
  final Research research;

  const RightSection(this.research);

  @override
  Widget build(BuildContext context) {
    return UpgradeButton(research);
  }
}
