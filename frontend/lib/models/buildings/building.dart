import 'package:nucleartension/extensions/resource_map_extension.dart';
import 'package:nucleartension/models/buildings/consumers/house.dart';
import 'package:nucleartension/models/buildings/consumers/town_center.dart';
import 'package:nucleartension/models/buildings/producers/copper_mine.dart';
import 'package:nucleartension/models/buildings/producers/farm.dart';
import 'package:nucleartension/models/buildings/producers/gold_mine.dart';
import 'package:nucleartension/models/buildings/producers/iron_mine.dart';
import 'package:nucleartension/models/buildings/producers/logging_camp.dart';
import 'package:nucleartension/models/buildings/producers/quarry.dart';
import 'package:nucleartension/models/colony.dart';
import 'package:nucleartension/types/building_type.dart';

class Building {
  final Colony colony;
  final BuildingType buildingType;
  int level;

  Building({
    required this.colony,
    required this.buildingType,
    required this.level,
  });

  ResourceMap get upgradeCost => buildingType.cost(level + 1);

  void update(double dt) {}

  bool get isProducer => false;

  bool get isConsumer => false;

  bool get canUpgrade => colony.resourceInventory.hasItems(upgradeCost);

  void upgrade() {
    if (canUpgrade) {
      colony.resourceInventory.removeItems(upgradeCost);
      level++;
    }
  }

  void destroy() {
    colony.removeBuilding(this);
  }

  factory Building.create({
    required Colony colony,
    required BuildingType buildingType,
    required int level,
    required int villagers,
  }) {
    switch (buildingType) {
      case BuildingType.townCenter:
        return TownCenter(
          colony: colony,
          level: level,
        );
      case BuildingType.house:
        return House(
          colony: colony,
          level: level,
        );
      case BuildingType.farm:
        return Farm(
          colony: colony,
          level: level,
          villagers: villagers,
        );
      case BuildingType.loggingCamp:
        return LoggingCamp(
          colony: colony,
          level: level,
          villagers: villagers,
        );
      case BuildingType.quarry:
        return Quarry(
          colony: colony,
          level: level,
          villagers: villagers,
        );
      case BuildingType.copperMine:
        return CopperMine(
          colony: colony,
          level: level,
          villagers: villagers,
        );
      case BuildingType.ironMine:
        return IronMine(
          colony: colony,
          level: level,
          villagers: villagers,
        );
      case BuildingType.goldMine:
        return GoldMine(
          colony: colony,
          level: level,
          villagers: villagers,
        );
    }
  }
}
