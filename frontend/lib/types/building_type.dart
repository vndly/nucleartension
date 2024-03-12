import 'package:nucleartension/extensions/resource_map_extension.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/assets.dart';

enum BuildingType {
  power_plant(
    sprite: Assets.IMAGES_BUILDINGS_FARM,
    initialCost: {
      ResourceType.energy: 50,
      ResourceType.supplies: 50,
    },
  ),
  supply_center(
    sprite: Assets.IMAGES_BUILDINGS_FARM,
    initialCost: {
      ResourceType.energy: 50,
      ResourceType.supplies: 50,
    },
  ),
  propaganda_station(
    sprite: Assets.IMAGES_BUILDINGS_FARM,
    initialCost: {
      ResourceType.energy: 50,
      ResourceType.supplies: 50,
    },
  ),
  tech_lab(
    sprite: Assets.IMAGES_BUILDINGS_FARM,
    initialCost: {
      ResourceType.energy: 50,
      ResourceType.supplies: 50,
    },
  ),
  silo(
    sprite: Assets.IMAGES_BUILDINGS_FARM,
    initialCost: {
      ResourceType.energy: 50,
      ResourceType.supplies: 50,
    },
  );

  final String sprite;
  final ResourceMap initialCost;

  const BuildingType({
    required this.sprite,
    required this.initialCost,
  });

  ResourceMap cost(int level) => initialCost.multiply(level);

  @override
  String toString() => name.replaceAll('_', ' ');
}
