import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/building.dart';
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
    return ImageAsset(
      path: building.buildingType.sprite,
      size: size,
    );
  }
}

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
