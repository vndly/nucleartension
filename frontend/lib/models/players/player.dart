import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';

class Player {
  final Game game;
  final ResourceInventory resources;
  final List<Building> buildings;
  int militaryPower;
  int defenseMissiles;
  int attackMissiles;

  Player({
    required this.game,
    required this.resources,
    required this.buildings,
    required this.militaryPower,
    required this.defenseMissiles,
    required this.attackMissiles,
  });
}
