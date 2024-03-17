import 'package:nucleartension/extensions/resource_map_extension.dart';
import 'package:nucleartension/models/base.dart';
import 'package:nucleartension/models/buildings/producers/power_plant.dart';
import 'package:nucleartension/models/buildings/producers/propaganda_station.dart';
import 'package:nucleartension/models/buildings/producers/supply_center.dart';
import 'package:nucleartension/models/buildings/producers/tech_lab.dart';
import 'package:nucleartension/types/building_type.dart';

class Building {
  final Base base;
  final BuildingType buildingType;
  int level;

  Building({
    required this.base,
    required this.buildingType,
    required this.level,
  });

  ResourceMap get upgradeCost => buildingType.cost(level + 1);

  void update(double dt) {}

  bool get isProducer => false;

  bool get canUpgrade => base.resourceInventory.hasItems(upgradeCost);

  void upgrade() {
    if (canUpgrade) {
      base.resourceInventory.removeItems(upgradeCost);
      level++;
    }
  }

  void destroy() {
    base.removeBuilding(this);
  }

  factory Building.create({
    required Base base,
    required BuildingType buildingType,
    required int level,
  }) {
    switch (buildingType) {
      case BuildingType.power_plant:
        return PowerPlant(
          base: base,
          level: level,
        );
      case BuildingType.supply_center:
        return SupplyCenter(
          base: base,
          level: level,
        );
      case BuildingType.propaganda_station:
        return PropagandaStation(
          base: base,
          level: level,
        );
      case BuildingType.tech_lab:
        return TechLab(
          base: base,
          level: level,
        );
      case BuildingType.silo:
        throw Exception();
    }
  }
}
