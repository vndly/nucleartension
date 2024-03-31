import 'package:dafluta/dafluta.dart';
import 'package:nucleartension/models/buildings/producers/power_plant.dart';
import 'package:nucleartension/models/buildings/producers/propaganda_station.dart';
import 'package:nucleartension/models/buildings/producers/supply_center.dart';
import 'package:nucleartension/models/buildings/producers/tech_lab.dart';
import 'package:nucleartension/models/buildings/trainers/military_facility.dart';
import 'package:nucleartension/models/buildings/trainers/missile_silo.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/military.dart';
import 'package:nucleartension/models/players/passive_player.dart';
import 'package:nucleartension/models/players/self_player.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/types/unit_type.dart';

class GameState extends BaseState {
  late final Game game;

  GameState() {
    game = Game(
      players: [],
      timeElapsed: 0,
      defcon: 5,
    );

    final SelfPlayer player = SelfPlayer(
      game: game,
      name: 'Momo',
      resources: ResourceInventory({
        ResourceType.energy: 200,
        ResourceType.supplies: 200,
        ResourceType.population: 1000000,
        ResourceType.technology: 0,
      }),
      buildings: [],
      military: Military(
        power: 0,
        defenseMissiles: 0,
        attackMissiles: 0,
      ),
    );

    player.buildings.addAll([
      PowerPlant(
        player: player,
        level: 1,
      ),
      SupplyCenter(
        player: player,
        level: 1,
      ),
      TechLab(
        player: player,
        level: 0,
      ),
      PropagandaStation(
        player: player,
        level: 0,
      ),
      MilitaryFacility(
        player: player,
        level: 1,
        queues: {
          UnitType.infantry: [],
          UnitType.vehicle: [],
          UnitType.aircraft: [],
        },
      ),
      MissileSilo(
        player: player,
        level: 1,
        queues: {
          UnitType.defense: [],
          UnitType.attack: [],
        },
      ),
    ]);

    game.setPlayers([
      player,
      PassivePlayer(
        game: game,
        name: 'Bob',
        resources: ResourceInventory({}),
        buildings: [],
        military: Military(
          power: 0,
          defenseMissiles: 0,
          attackMissiles: 0,
        ),
      ),
      PassivePlayer(
        game: game,
        name: 'Max',
        resources: ResourceInventory({}),
        buildings: [],
        military: Military(
          power: 0,
          defenseMissiles: 0,
          attackMissiles: 0,
        ),
      ),
      PassivePlayer(
        game: game,
        name: 'Ray',
        resources: ResourceInventory({}),
        buildings: [],
        military: Military(
          power: 0,
          defenseMissiles: 0,
          attackMissiles: 0,
        ),
      ),
      PassivePlayer(
        game: game,
        name: 'Tom',
        resources: ResourceInventory({}),
        buildings: [],
        military: Military(
          power: 0,
          defenseMissiles: 0,
          attackMissiles: 0,
        ),
      ),
    ]);
  }

  void update(double dt) {
    game.update(dt);
  }
}
