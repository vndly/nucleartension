import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/producers/producer.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/buttons/upgrade_building_button.dart';
import 'package:nucleartension/widgets/images/image_block.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class ProducerBlock extends StatelessWidget {
  final Producer producer;

  const ProducerBlock(this.producer);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Palette.backgroundProducer,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Palette.separator,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeftSection(producer),
          const Spacer(),
          RightSection(producer),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageBlock(
          path: producer.buildingType.sprite,
          size: 80,
        ),
        const HBox(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Label(
              text: producer.buildingType.toString().toUpperCase(),
              color: Palette.text,
              weight: FontWeight.bold,
              size: 16,
            ),
            const VBox(10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  producer.resourceType.icon,
                  size: 16,
                  color: Palette.icon,
                ),
                const HBox(5),
                Label(
                  text: '${Formatter.production(producer.production)}/s',
                  color:
                      (producer.production == 0) ? Palette.error : Palette.text,
                  size: 16,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class RightSection extends StatelessWidget {
  final Producer producer;

  const RightSection(this.producer);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Label(
              text: 'LEVEL',
              color: Palette.text,
              weight: FontWeight.bold,
              size: 16,
            ),
            const HBox(10),
            Container(
              decoration: const BoxDecoration(
                color: Palette.chip,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                shape: BoxShape.rectangle,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 2,
                    bottom: 4,
                    left: 5,
                    right: 5,
                  ),
                  child: Label(
                    text: producer.level.toString(),
                    color: Palette.text,
                    align: TextAlign.center,
                    size: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
        const VBox(10),
        UpgradeBuildingButton(producer),
      ],
    );
  }
}
