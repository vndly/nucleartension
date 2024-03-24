import 'package:nucleartension/extensions/resource_map_extension.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/assets.dart';

enum BuildingType {
  power_plant(
    sprite: Assets.IMAGES_BUILDINGS_POWER_PLANT,
    initialCost: {
      ResourceType.energy: 20,
      ResourceType.supplies: 20,
    },
  ),
  supply_center(
    sprite: Assets.IMAGES_BUILDINGS_SUPPLY_CENTER,
    initialCost: {
      ResourceType.energy: 20,
      ResourceType.supplies: 20,
    },
  ),
  propaganda_station(
    sprite: Assets.IMAGES_BUILDINGS_PROPAGANDA_STATION,
    initialCost: {
      ResourceType.energy: 50,
      ResourceType.supplies: 50,
    },
  ),
  tech_lab(
    sprite: Assets.IMAGES_BUILDINGS_TECH_LAB,
    initialCost: {
      ResourceType.energy: 100,
      ResourceType.supplies: 100,
    },
  ),
  missile_silo(
    sprite: Assets.IMAGES_BUILDINGS_MISSILE_SILO,
    initialCost: {
      ResourceType.energy: 200,
      ResourceType.supplies: 200,
    },
  ),
  military_facility(
    sprite: Assets.IMAGES_BUILDINGS_MILITARY_FACILITY,
    initialCost: {
      ResourceType.energy: 200,
      ResourceType.supplies: 200,
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
