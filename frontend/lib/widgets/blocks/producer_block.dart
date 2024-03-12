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
        color: Palette.producerBlock,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Palette.lightGrey,
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Label(
                  text: producer.buildingType.toString().toUpperCase(),
                  color: Palette.black,
                  weight: FontWeight.bold,
                  size: 18,
                ),
                const HBox(5),
                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Palette.lightGrey,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Label(
                      text: producer.level.toString(),
                      color: Palette.white,
                      align: TextAlign.center,
                      size: 8,
                    ),
                  ),
                ),
              ],
            ),
            const VBox(10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  producer.resourceType.icon,
                  size: 18,
                ),
                const HBox(5),
                Label(
                  text: '${Formatter.production(producer.production)}/s',
                  color: (producer.production == 0)
                      ? Palette.error
                      : Palette.black,
                  size: 18,
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
    return UpgradeBuildingButton(producer);
  }
}
