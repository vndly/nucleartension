import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nucleartension/dialog/information_dialog.dart';
import 'package:nucleartension/models/buildings/producers/producer.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/blocks/building_container.dart';
import 'package:nucleartension/widgets/buttons/upgrade_building_button.dart';
import 'package:nucleartension/widgets/images/image_block.dart';
import 'package:nucleartension/widgets/labels/label.dart';
import 'package:nucleartension/widgets/labels/labeled_info.dart';

class ProducerBlock extends StatelessWidget {
  final Producer producer;

  const ProducerBlock(this.producer);

  @override
  Widget build(BuildContext context) {
    return BuildingContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          LabeledInfo(
            title: producer.buildingType.toString().toUpperCase(),
            onTap: () => InformationDialog.information(
              title: producer.buildingType.toString().toUpperCase(),
              message:
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.',
            ),
          ),
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
    return UpgradeBuildingButton(producer);
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
          text: '${Formatter.production(producer.production)}/s',
          color: (producer.production == 0) ? Palette.error : Palette.textLight,
          size: 15,
        ),
      ],
    );
  }
}
