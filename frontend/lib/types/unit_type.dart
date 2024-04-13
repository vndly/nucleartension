import 'package:nucleartension/extensions/item_map_extension.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/research_type.dart';
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

  ResourceMap effectiveCost(Player player) {
    final Research research = player.getResearch(researchCost);

    return cost.multiply(research.decreaseRate);
  }

  num effectiveDuration(Player player) {
    final Research research = player.getResearch(researchTime);

    return cost.duration * research.decreaseRate;
  }

  String get localized {
    switch (this) {
      case defense:
        return 'Defense Missile';
      case attack:
        return 'Attack Missile';
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
        return 'Missiles used to intercept incoming missiles attacks. Each defense missile has a base effectiveness of 50% that can be improved researching new technologies.';
      case attack:
        return "Missiles used to send nuclear attacks to enemies. If an attack missiles is not intercepted, it kills an amount of the enemy's population proportionally to the missile yield.";
      case infantry:
        return 'Basic military soldier squad. It increases the military power by $power.';
      case vehicle:
        return 'Land military vehicles. It increases the military power by $power.';
      case aircraft:
        return 'Advance jet fighters. It increases the military power by $power.';
    }
  }

  ResearchType get researchCost {
    switch (this) {
      case defense:
      case attack:
        return ResearchType.missiles_additive_manufacturing;
      case infantry:
        return ResearchType.military_infantry_cost;
      case vehicle:
        return ResearchType.military_vehicles_cost;
      case aircraft:
        return ResearchType.military_aircraft_cost;
    }
  }

  ResearchType get researchTime {
    switch (this) {
      case defense:
      case attack:
        return ResearchType.missiles_assembly_automation;
      case infantry:
        return ResearchType.military_infantry_time;
      case vehicle:
        return ResearchType.military_vehicles_time;
      case aircraft:
        return ResearchType.military_aircraft_time;
    }
  }
}
