import 'package:dafluta/dafluta.dart';
import 'package:nucleartension/models/buildings/military_facility.dart';
import 'package:nucleartension/models/buildings/producers/power_plant.dart';
import 'package:nucleartension/models/buildings/producers/propaganda_station.dart';
import 'package:nucleartension/models/buildings/producers/supply_center.dart';
import 'package:nucleartension/models/buildings/producers/tech_lab.dart';
import 'package:nucleartension/models/buildings/silo.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/types/resource_type.dart';

class GameState extends BaseState {
  late final Game game;

  GameState() {
    game = Game(
      resourceInventory: ResourceInventory.create(
        resources: {
          ResourceType.energy: 200,
          ResourceType.supplies: 200,
          ResourceType.population: 1000000,
          ResourceType.technology: 0,
        },
        capacities: {
          ResourceType.energy: double.maxFinite,
          ResourceType.supplies: double.maxFinite,
          ResourceType.population: double.maxFinite,
          ResourceType.technology: double.maxFinite,
        },
      ),
      buildings: [],
    );

    game.addBuildings([
      PowerPlant(
        game: game,
        level: 1,
      ),
      SupplyCenter(
        game: game,
        level: 1,
      ),
      PropagandaStation(
        game: game,
        level: 0,
      ),
      TechLab(
        game: game,
        level: 0,
      ),
      MissileSilo(
        game: game,
        level: 1,
      ),
      MilitaryFacility(
        game: game,
        level: 1,
      ),
    ]);
  }

  void update(double dt) {
    game.update(dt);
  }
}
