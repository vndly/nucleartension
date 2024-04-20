import 'package:nucleartension/extensions/item_map_extension.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/types/unit_type.dart';
import 'package:nucleartension/utils/assets.dart';
import 'package:nucleartension/utils/localizations.dart';

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
  tech_lab(
    sprite: Assets.IMAGES_BUILDINGS_TECH_LAB,
    initialCost: {
      ResourceType.energy: 100,
      ResourceType.supplies: 100,
    },
  ),
  propaganda_station(
    sprite: Assets.IMAGES_BUILDINGS_PROPAGANDA_STATION,
    initialCost: {
      ResourceType.energy: 50,
      ResourceType.supplies: 50,
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
      case BuildingType.tech_lab:
      case BuildingType.propaganda_station:
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
          Localized.get.typeBuildingMilitaryFacilityDescription2,
          Localized.get.typeBuildingMilitaryFacilityDescription3,
          Localized.get.typeBuildingMilitaryFacilityDescription4,
          '',
          Localized.get.typeBuildingMilitaryFacilityDescription5,
        ];
    }
  }
}
