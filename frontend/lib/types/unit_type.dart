import 'package:nucleartension/extensions/resource_map_extension.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/assets.dart';

enum UnitType {
  defense(
    sprite: Assets.IMAGES_MISSILES_DEFENSE,
    cost: {
      ResourceType.energy: 20,
      ResourceType.supplies: 20,
    },
  ),
  attack(
    sprite: Assets.IMAGES_MISSILES_ATTACK,
    cost: {
      ResourceType.energy: 60,
      ResourceType.supplies: 60,
    },
  ),
  infantry(
    sprite: Assets.IMAGES_UNITS_INFANTRY,
    cost: {
      ResourceType.energy: 20,
      ResourceType.supplies: 20,
    },
  ),
  vehicles(
    sprite: Assets.IMAGES_UNITS_VEHICLE,
    cost: {
      ResourceType.energy: 20,
      ResourceType.supplies: 20,
    },
  ),
  aircraft(
    sprite: Assets.IMAGES_UNITS_AIRCRAFT,
    cost: {
      ResourceType.energy: 20,
      ResourceType.supplies: 20,
    },
  );

  final String sprite;
  final ResourceMap cost;

  const UnitType({
    required this.sprite,
    required this.cost,
  });

  @override
  String toString() => name.replaceAll('_', ' ');
}
