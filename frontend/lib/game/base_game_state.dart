import 'package:dafluta/dafluta.dart';
import 'package:nucleartension/models/buildings/consumers/town_center.dart';
import 'package:nucleartension/models/buildings/producers/farm.dart';
import 'package:nucleartension/models/buildings/producers/logging_camp.dart';
import 'package:nucleartension/models/colony.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/inventory/unit_inventory.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/types/unit_type.dart';

class BaseGameState extends BaseState {
  late final Colony colony;

  BaseGameState() {
    colony = Colony(
      resourceInventory: ResourceInventory.create(
        resources: {
          ResourceType.food: 80,
          ResourceType.wood: 100,
          ResourceType.stone: 30,
        },
        capacities: {
          ResourceType.food: 100,
          ResourceType.wood: 100,
          ResourceType.stone: 100,
        },
      ),
      unitInventory: UnitInventory.create(
        units: {
          UnitType.villager: 5,
        },
        capacities: {
          UnitType.villager: 10,
        },
      ),
      buildings: [],
      timeElapsed: 0,
      freeVillagers: 5,
    );

    colony.addBuildings([
      TownCenter(
        colony: colony,
        level: 1,
      ),
      Farm(
        colony: colony,
        level: 1,
        villagers: 0,
      ),
      LoggingCamp(
        colony: colony,
        level: 1,
        villagers: 0,
      ),
    ]);
  }

  void update(double dt) {
    colony.update(dt);
  }
}
