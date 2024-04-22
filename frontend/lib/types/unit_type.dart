import 'package:nucleartension/extensions/item_map_extension.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/research_type.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/assets.dart';
import 'package:nucleartension/utils/localizations.dart';

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

  ResourceMap effectiveCost(Player player) {
    final Research research = player.getResearch(researchCost);

    return cost.multiply(research.decreaseRate);
  }

  num effectiveDuration(Player player) {
    final Research research = player.getResearch(researchTime);

    return (cost.duration * research.decreaseRate) / 10;
  }

  String get localized {
    switch (this) {
      case defense:
        return Localized.get.typeUnitDefenseMissileName;
      case attack:
        return Localized.get.typeUnitAttackMissileName;
      case infantry:
        return Localized.get.typeUnitInfantryName;
      case vehicle:
        return Localized.get.typeUnitVehiclesName;
      case aircraft:
        return Localized.get.typeUnitAircraftName;
    }
  }

  List<String> get description {
    switch (this) {
      case defense:
        return [
          Localized.get.typeUnitDefenseMissileDescription1,
          '',
          Localized.get.typeUnitDefenseMissileDescription2,
        ];
      case attack:
        return [
          Localized.get.typeUnitAttackMissileDescription1,
          '',
          Localized.get.typeUnitAttackMissileDescription2,
        ];
      case infantry:
        return [
          Localized.get.typeUnitInfantryDescription(power),
        ];
      case vehicle:
        return [
          Localized.get.typeUnitVehiclesDescription(power),
        ];
      case aircraft:
        return [
          Localized.get.typeUnitAircraftDescription(power),
        ];
    }
  }

  ResearchType get researchCost {
    switch (this) {
      case defense:
      case attack:
        return ResearchType.missiles_additive_manufacturing;
      case infantry:
        return ResearchType.unit_infantry_cost;
      case vehicle:
        return ResearchType.unit_vehicles_cost;
      case aircraft:
        return ResearchType.unit_aircraft_cost;
    }
  }

  ResearchType get researchTime {
    switch (this) {
      case defense:
      case attack:
        return ResearchType.missiles_assembly_automation;
      case infantry:
        return ResearchType.unit_infantry_time;
      case vehicle:
        return ResearchType.unit_vehicles_time;
      case aircraft:
        return ResearchType.unit_aircraft_time;
    }
  }
}
