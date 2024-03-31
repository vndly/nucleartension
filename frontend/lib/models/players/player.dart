import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/military.dart';

class Player {
  final Game game;
  final String name;
  final ResourceInventory resources;
  final List<Building> buildings;
  final Military military;

  const Player({
    required this.game,
    required this.name,
    required this.resources,
    required this.buildings,
    required this.military,
  });

  void update(double dt) {}
}
