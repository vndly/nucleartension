import 'dart:math';
import 'package:nucleartension/extensions/item_map_extension.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/types/military_type.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/assets.dart';
import 'package:nucleartension/utils/localizations.dart';

enum BuildingType {
  power_plant(
    sprite: Assets.IMAGES_BUILDINGS_POWER_PLANT,
    costRate: 2,
    initialCost: {
      ResourceType.energy: 20,
      ResourceType.supplies: 20,
    },
  ),
  propaganda_station(
    sprite: Assets.IMAGES_BUILDINGS_PROPAGANDA_STATION,
    costRate: 2,
    initialCost: {
      ResourceType.energy: 100,
      ResourceType.supplies: 100,
    },
  ),
  missile_silo(
    sprite: Assets.IMAGES_BUILDINGS_MISSILE_SILO,
    costRate: 2,
    initialCost: {
      ResourceType.energy: 200,
      ResourceType.supplies: 200,
    },
  );

  final String sprite;
  final double costRate;
  final ResourceMap initialCost;

  const BuildingType({
    required this.sprite,
    required this.costRate,
    required this.initialCost,
  });

  ResourceMap cost(int level) => initialCost.multiply(pow(costRate, level - 1));

  List<MilitaryType> get military {
    switch (this) {
      case BuildingType.power_plant:
      case BuildingType.propaganda_station:
        return [];
      case BuildingType.missile_silo:
        return [
          MilitaryType.missile_defense,
          MilitaryType.missile_attack,
        ];
    }
  }

  String get localized {
    switch (this) {
      case power_plant:
        return Localized.get.typeBuildingPowerPlantName;
      case propaganda_station:
        return Localized.get.typeBuildingPropagandaStationName;
      case missile_silo:
        return Localized.get.typeBuildingMissileSiloName;
    }
  }
}
