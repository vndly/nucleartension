import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/widgets/labels/chip_text.dart';

class LevelIndicator extends StatelessWidget {
  final Building building;

  const LevelIndicator(this.building);

  @override
  Widget build(BuildContext context) {
    return ChipText(
      label: 'LEVEL',
      text: building.level.toString(),
    );
  }
}
