import 'package:dafluta/dafluta.dart';
import 'package:nucleartension/models/buildings/producers/power_plant.dart';
import 'package:nucleartension/models/buildings/producers/propaganda_station.dart';
import 'package:nucleartension/models/buildings/producers/supply_center.dart';
import 'package:nucleartension/models/buildings/producers/tech_lab.dart';
import 'package:nucleartension/models/buildings/trainers/military_facility.dart';
import 'package:nucleartension/models/buildings/trainers/missile_silo.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/player.dart';
import 'package:nucleartension/types/resource_type.dart';

class GameState extends BaseState {
  late final Game game;

  GameState() {
    game = Game(
      players: [],
      timeElapsed: 0,
      defcon: 5,
    );

    final Player player = Player(
      game: game,
      resourceInventory: ResourceInventory({
        ResourceType.energy: 200,
        ResourceType.supplies: 200,
        ResourceType.population: 1000000,
        ResourceType.technology: 0,
      }),
      buildings: [],
      militaryPower: 0,
      defenseMissiles: 0,
      attackMissiles: 0,
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
      PropagandaStation(
        player: player,
        level: 0,
      ),
      TechLab(
        player: player,
        level: 0,
      ),
      MissileSilo(
        player: player,
        level: 1,
        missileDefenseQueue: [],
        missileAttackQueue: [],
      ),
      MilitaryFacility(
        player: player,
        level: 1,
      ),
    ]);

    game.players.add(player);
  }

  void update(double dt) {
    game.update(dt);
  }
}
