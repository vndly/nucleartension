import 'package:dafluta/dafluta.dart';
import 'package:nucleartension/models/buildings/producers/power_plant.dart';
import 'package:nucleartension/models/buildings/producers/propaganda_station.dart';
import 'package:nucleartension/models/buildings/producers/supply_center.dart';
import 'package:nucleartension/models/buildings/producers/tech_lab.dart';
import 'package:nucleartension/models/colony.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/types/resource_type.dart';

class BaseGameState extends BaseState {
  late final Colony colony;

  BaseGameState() {
    colony = Colony(
      resourceInventory: ResourceInventory.create(
        resources: {
          ResourceType.population: 80,
          ResourceType.energy: 100,
          ResourceType.supplies: 30,
        },
        capacities: {
          ResourceType.population: 100,
          ResourceType.energy: 100,
          ResourceType.supplies: 100,
        },
      ),
      buildings: [],
      timeElapsed: 0,
    );

    colony.addBuildings([
      PowerPlant(
        colony: colony,
        level: 1,
      ),
      SupplyCenter(
        colony: colony,
        level: 1,
      ),
      PropagandaStation(
        colony: colony,
        level: 0,
      ),
      TechLab(
        colony: colony,
        level: 0,
      ),
    ]);
  }

  void update(double dt) {
    colony.update(dt);
  }
}
