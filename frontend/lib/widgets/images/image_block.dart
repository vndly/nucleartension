import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/unit_type.dart';
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

/*class LeveledImageBlock extends StatelessWidget {
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
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ImageAsset(
          path: sprite,
          size: size,
        ),
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            border: Border.all(
              color: Palette.borderImage,
              width: size / 30,
            ),
            shape: BoxShape.rectangle,
          ),
        ),
        if (level > 0)
          Container(
            color: Palette.borderImage,
            margin: EdgeInsets.only(
              bottom: size / 35,
              right: size / 35,
            ),
            padding: const EdgeInsets.only(
              top: 3,
              bottom: 1,
              left: 7,
              right: 4,
            ),
            child: Label(
              text: level.toString(),
              size: 16,
              color: Palette.textDark,
              weight: FontWeight.bold,
            ),
          ),
      ],
    );
  }
}*/

class UnitImageBlock extends StatelessWidget {
  final UnitType unitType;
  final double size;

  const UnitImageBlock({
    required this.unitType,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ImageAsset(
      path: unitType.sprite,
      size: size,
    );
  }
}
