import 'package:nucleartension/extensions/resource_map_extension.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/assets.dart';

enum UnitType {
  defense(
    sprite: Assets.IMAGES_MISSILES_DEFENSE,
    power: 0,
    cost: {
      ResourceType.energy: 20,
      ResourceType.supplies: 20,
    },
  ),
  attack(
    sprite: Assets.IMAGES_MISSILES_ATTACK,
    power: 0,
    cost: {
      ResourceType.energy: 60,
      ResourceType.supplies: 60,
    },
  ),
  infantry(
    sprite: Assets.IMAGES_UNITS_INFANTRY,
    power: 1,
    cost: {
      ResourceType.energy: 20,
      ResourceType.supplies: 20,
    },
  ),
  vehicle(
    sprite: Assets.IMAGES_UNITS_VEHICLE,
    power: 3,
    cost: {
      ResourceType.energy: 20,
      ResourceType.supplies: 40,
    },
  ),
  aircraft(
    sprite: Assets.IMAGES_UNITS_AIRCRAFT,
    power: 7,
    cost: {
      ResourceType.energy: 80,
      ResourceType.supplies: 60,
    },
  );

  final String sprite;
  final int power;
  final ResourceMap cost;

  const UnitType({
    required this.sprite,
    required this.power,
    required this.cost,
  });

  String get localized {
    switch (this) {
      case defense:
        return 'Defense';
      case attack:
        return 'Attack';
      case infantry:
        return 'Infantry';
      case vehicle:
        return 'Vehicle';
      case aircraft:
        return 'Aircraft';
    }
  }

  String get description {
    switch (this) {
      case defense:
        return 'GGG';
      case attack:
        return 'HHH';
      case infantry:
        return 'III';
      case vehicle:
        return 'JJJ';
      case aircraft:
        return 'KKK';
    }
  }
}
