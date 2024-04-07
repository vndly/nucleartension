import 'package:nucleartension/extensions/item_map_extension.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/types/unit_type.dart';
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

  List<UnitType> get units {
    switch (this) {
      case BuildingType.power_plant:
      case BuildingType.supply_center:
      case BuildingType.propaganda_station:
      case BuildingType.tech_lab:
        return [];
      case BuildingType.missile_silo:
        return [
          UnitType.defense,
          UnitType.attack,
        ];
      case BuildingType.military_facility:
        return [
          UnitType.infantry,
          UnitType.vehicle,
          UnitType.aircraft,
        ];
    }
  }

  String get localized {
    switch (this) {
      case power_plant:
        return 'Power Plant';
      case supply_center:
        return 'Supply Center';
      case propaganda_station:
        return 'Propaganda Station';
      case tech_lab:
        return 'Tech Lab';
      case missile_silo:
        return 'Missile Silo';
      case military_facility:
        return 'Military Facility';
    }
  }

  String get description {
    switch (this) {
      case power_plant:
        return 'AAA';
      case supply_center:
        return 'BBB';
      case propaganda_station:
        return 'CCC';
      case tech_lab:
        return 'DDD';
      case missile_silo:
        return 'EEE';
      case military_facility:
        return 'FFF';
    }
  }
}
