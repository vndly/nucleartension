import 'package:nucleartension/extensions/resource_map_extension.dart';
import 'package:nucleartension/models/buildings/producers/power_plant.dart';
import 'package:nucleartension/models/buildings/producers/propaganda_station.dart';
import 'package:nucleartension/models/buildings/producers/supply_center.dart';
import 'package:nucleartension/models/buildings/producers/tech_lab.dart';
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
  }) {
    switch (buildingType) {
      case BuildingType.power_plant:
        return PowerPlant(
          colony: colony,
          level: level,
        );
      case BuildingType.supply_center:
        return SupplyCenter(
          colony: colony,
          level: level,
        );
      case BuildingType.propaganda_station:
        return PropagandaStation(
          colony: colony,
          level: level,
        );
      case BuildingType.tech_lab:
        return TechLab(
          colony: colony,
          level: level,
        );
      case BuildingType.silo:
        throw Exception();
    }
  }
}
