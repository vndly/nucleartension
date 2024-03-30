import 'package:nucleartension/extensions/resource_map_extension.dart';
import 'package:nucleartension/models/buildings/producers/power_plant.dart';
import 'package:nucleartension/models/buildings/producers/propaganda_station.dart';
import 'package:nucleartension/models/buildings/producers/supply_center.dart';
import 'package:nucleartension/models/buildings/producers/tech_lab.dart';
import 'package:nucleartension/models/player.dart';
import 'package:nucleartension/models/tasks/upgrade_building_task.dart';
import 'package:nucleartension/types/building_type.dart';

class Building {
  final Player player;
  final BuildingType buildingType;
  int level;
  UpgradeBuildingTask? upgradeTask;

  Building({
    required this.player,
    required this.buildingType,
    required this.level,
  });

  ResourceMap get upgradeCost => buildingType.cost(level + 1);

  bool get isProducer => false;

  bool get isUpgrading => upgradeTask != null;

  double get upgradeProgress => upgradeTask?.progress ?? 0;

  Duration get upgradeTimeLeft => upgradeTask?.timeLeft ?? Duration.zero;

  bool get canUpgrade =>
      !isUpgrading && player.resourceInventory.hasItems(upgradeCost);

  void update(double dt) {
    if ((upgradeTask != null) && upgradeTask!.update(dt)) {
      level++;
      upgradeTask = null;
    }
  }

  void upgrade() {
    if (canUpgrade) {
      player.resourceInventory.removeItems(upgradeCost);
      upgradeTask = UpgradeBuildingTask(
        building: this,
        cost: upgradeCost,
      );
    }
  }

  void cancelUpgrade() {
    if (upgradeTask != null) {
      player.resourceInventory.addItems(upgradeCost);
      upgradeTask = null;
    }
  }

  factory Building.create({
    required Player player,
    required BuildingType buildingType,
    required int level,
  }) {
    switch (buildingType) {
      case BuildingType.power_plant:
        return PowerPlant(
          player: player,
          level: level,
        );
      case BuildingType.supply_center:
        return SupplyCenter(
          player: player,
          level: level,
        );
      case BuildingType.propaganda_station:
        return PropagandaStation(
          player: player,
          level: level,
        );
      case BuildingType.tech_lab:
        return TechLab(
          player: player,
          level: level,
        );
      case BuildingType.missile_silo:
      case BuildingType.military_facility:
        throw Exception();
    }
  }
}
