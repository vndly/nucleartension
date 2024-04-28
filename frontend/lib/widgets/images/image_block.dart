import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/military_type.dart';
import 'package:nucleartension/widgets/images/image_asset.dart';

class BuildingImageBlock extends StatelessWidget {
  final Building building;
  final double size;

  const BuildingImageBlock({
    required this.building,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return LeveledImageBlock(
      sprite: building.buildingType.sprite,
      level: building.level,
      size: size,
    );
  }
}

class ResearchImageBlock extends StatelessWidget {
  final Research research;
  final double size;

  const ResearchImageBlock({
    required this.research,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return LeveledImageBlock(
      sprite: research.researchType.sprite,
      level: research.level,
      size: size,
    );
  }
}

class LeveledImageBlock extends StatelessWidget {
  final String sprite;
  final int level;
  final double size;

  const LeveledImageBlock({
    required this.sprite,
    required this.level,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ImageAsset(
      path: sprite,
      size: size,
    );
  }
}

class MilitaryImageBlock extends StatelessWidget {
  final MilitaryType militaryType;
  final double size;

  const MilitaryImageBlock({
    required this.militaryType,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ImageAsset(
      path: militaryType.sprite,
      size: size,
    );
  }
}
