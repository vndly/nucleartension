import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class LevelIndicator extends StatelessWidget {
  final Building building;

  const LevelIndicator(this.building);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Label(
          text: 'LEVEL',
          color: Palette.text,
          weight: FontWeight.bold,
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
                top: 1,
                bottom: 2,
                left: 6,
                right: 6,
              ),
              child: Label(
                text: building.level.toString(),
                color: Palette.text,
                align: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
