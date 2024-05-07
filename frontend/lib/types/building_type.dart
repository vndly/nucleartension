import 'dart:math';
import 'package:nucleartension/extensions/item_map_extension.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/requirement.dart';
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
  supply_center(
    sprite: Assets.IMAGES_BUILDINGS_SUPPLY_CENTER,
    costRate: 2,
    initialCost: {
      ResourceType.energy: 20,
      ResourceType.supplies: 20,
    },
  ),
  tech_lab(
    sprite: Assets.IMAGES_BUILDINGS_TECH_LAB,
    costRate: 2,
    initialCost: {
      ResourceType.energy: 50,
      ResourceType.supplies: 50,
    },
    requirement: Requirement(
      type: BuildingType.power_plant,
      minLevel: 1,
    ),
  ),
  propaganda_station(
    sprite: Assets.IMAGES_BUILDINGS_PROPAGANDA_STATION,
    costRate: 2,
    initialCost: {
      ResourceType.energy: 100,
      ResourceType.supplies: 100,
    },
    requirement: Requirement(
      type: BuildingType.supply_center,
      minLevel: 1,
    ),
  ),
  military_facility(
    sprite: Assets.IMAGES_BUILDINGS_MILITARY_FACILITY,
    costRate: 2,
    initialCost: {
      ResourceType.energy: 100,
      ResourceType.supplies: 100,
    },
    requirement: Requirement(
      type: BuildingType.supply_center,
      minLevel: 3,
    ),
  ),
  missile_silo(
    sprite: Assets.IMAGES_BUILDINGS_MISSILE_SILO,
    costRate: 2,
    initialCost: {
      ResourceType.energy: 200,
      ResourceType.supplies: 200,
    },
    requirement: Requirement(
      type: BuildingType.power_plant,
      minLevel: 3,
    ),
  );

  final String sprite;
  final double costRate;
  final ResourceMap initialCost;
  final Requirement<BuildingType> requirement;

  const BuildingType({
    required this.sprite,
    required this.costRate,
    required this.initialCost,
    this.requirement = const Requirement(),
  });

  ResourceMap cost(int level) => initialCost.multiply(pow(costRate, level - 1));

  List<MilitaryType> get military {
    switch (this) {
      case BuildingType.power_plant:
      case BuildingType.supply_center:
      case BuildingType.tech_lab:
      case BuildingType.propaganda_station:
        return [];
      case BuildingType.military_facility:
        return [
          MilitaryType.troop,
        ];
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
      case supply_center:
        return Localized.get.typeBuildingSupplyCenterName;
      case tech_lab:
        return Localized.get.typeBuildingTechLabName;
      case propaganda_station:
        return Localized.get.typeBuildingPropagandaStationName;
      case missile_silo:
        return Localized.get.typeBuildingMissileSiloName;
      case military_facility:
        return Localized.get.typeBuildingMilitaryFacilityName;
    }
  }

  List<String> get description {
    switch (this) {
      case power_plant:
        return [
          Localized.get.typeBuildingPowerPlantDescription1,
          '',
          Localized.get.typeBuildingPowerPlantDescription2,
        ];
      case supply_center:
        return [
          Localized.get.typeBuildingSupplyCenterDescription1,
          '',
          Localized.get.typeBuildingSupplyCenterDescription2,
        ];
      case tech_lab:
        return [
          Localized.get.typeBuildingTechLabDescription1,
          '',
          Localized.get.typeBuildingTechLabDescription2,
        ];
      case propaganda_station:
        return [
          Localized.get.typeBuildingPropagandaStationDescription1,
          '',
          Localized.get.typeBuildingPropagandaStationDescription2,
        ];
      case missile_silo:
        return [
          Localized.get.typeBuildingMissileSiloDescription1,
          '',
          Localized.get.typeBuildingMissileSiloDescription2,
        ];
      case military_facility:
        return [
          Localized.get.typeBuildingMilitaryFacilityDescription1,
          '',
          Localized.get.typeBuildingMilitaryFacilityDescription2,
        ];
    }
  }
}
