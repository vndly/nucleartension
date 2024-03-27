import 'package:nucleartension/extensions/resource_map_extension.dart';
import 'package:nucleartension/models/buildings/producers/power_plant.dart';
import 'package:nucleartension/models/buildings/producers/propaganda_station.dart';
import 'package:nucleartension/models/buildings/producers/supply_center.dart';
import 'package:nucleartension/models/buildings/producers/tech_lab.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/tasks/upgrade_building_task.dart';
import 'package:nucleartension/types/building_type.dart';

class Building {
  final Game game;
  final BuildingType buildingType;
  int level;
  UpgradeBuildingTask? upgradeTask;

  Building({
    required this.game,
    required this.buildingType,
    required this.level,
  });

  ResourceMap get upgradeCost => buildingType.cost(level + 1);

  bool get isProducer => false;

  bool get canUpgrade => game.resourceInventory.hasItems(upgradeCost);

  void update(double dt) {
    if ((upgradeTask != null) && upgradeTask!.update(dt)) {
      level++;
      upgradeTask = null;
    }
  }

  void upgrade() {
    if ((upgradeTask == null) && canUpgrade) {
      game.resourceInventory.removeItems(upgradeCost);
      upgradeTask = UpgradeBuildingTask(
        building: this,
        cost: upgradeCost,
      );
    }
  }

  void cancelUpgrade() {
    if (upgradeTask != null) {
      game.resourceInventory.addItems(upgradeCost);
      upgradeTask = null;
    }
  }

  void destroy() {
    game.removeBuilding(this);
  }

  factory Building.create({
    required Game game,
    required BuildingType buildingType,
    required int level,
  }) {
    switch (buildingType) {
      case BuildingType.power_plant:
        return PowerPlant(
          game: game,
          level: level,
        );
      case BuildingType.supply_center:
        return SupplyCenter(
          game: game,
          level: level,
        );
      case BuildingType.propaganda_station:
        return PropagandaStation(
          game: game,
          level: level,
        );
      case BuildingType.tech_lab:
        return TechLab(
          game: game,
          level: level,
        );
      case BuildingType.missile_silo:
      case BuildingType.military_facility:
        throw Exception();
    }
  }
}
