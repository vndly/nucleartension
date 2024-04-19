import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/dialog/information_dialog.dart';
import 'package:nucleartension/models/buildings/producers/producer.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/buttons/upgrade_building_button.dart';
import 'package:nucleartension/widgets/images/image_block.dart';
import 'package:nucleartension/widgets/labels/label.dart';
import 'package:nucleartension/widgets/labels/labeled_info.dart';
import 'package:nucleartension/widgets/labels/labeled_text.dart';

class ProducerBlock extends StatelessWidget {
  final Producer producer;

  const ProducerBlock(this.producer);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Palette.backgroundRow,
      child: InkWell(
        onTap: () => InformationDialog.building(producer.buildingType),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              HeaderSection(producer),
              const VBox(12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LeftSection(producer),
                  const Spacer(),
                  RightSection(producer),
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
  final Producer producer;

  const HeaderSection(this.producer);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LabeledInfo(
          title: producer.buildingType.localized.toUpperCase(),
          onTap: () => InformationDialog.building(producer.buildingType),
        ),
        if (producer.level > 0) ...[
          const Spacer(),
          LabeledText(
            label: '${Localized.get.labelLevel}:',
            text: producer.level.toString(),
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
  final Producer producer;

  const LeftSection(this.producer);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BuildingImageBlock(
          building: producer,
          size: 70,
        ),
        const HBox(15),
        ProductionIndicator(producer),
      ],
    );
  }
}

class RightSection extends StatelessWidget {
  final Producer producer;

  const RightSection(this.producer);

  @override
  Widget build(BuildContext context) {
    return UpgradeButton(
      upgradable: producer,
      size: 70,
    );
  }
}

class ProductionIndicator extends StatelessWidget {
  final Producer producer;

  const ProductionIndicator(this.producer);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        producer.resourceType.icon(15),
        const HBox(10),
        Label(
          text:
              '${Formatter.production(producer.production)}/${Localized.get.labelSecond}',
          color:
              (producer.production == 0) ? Palette.error : Palette.textPrimary,
          size: 15,
        ),
      ],
    );
  }
}
