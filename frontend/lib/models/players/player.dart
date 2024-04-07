import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/military.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/building_type.dart';

class Player {
  final Game game;
  final String name;
  final Color color;
  final ResourceInventory resources;
  final Map<BuildingType, Building> buildings;
  final List<Research> researches;
  final Military military;

  const Player({
    required this.game,
    required this.name,
    required this.color,
    required this.resources,
    required this.buildings,
    required this.researches,
    required this.military,
  });

  void addBuildings(List<Building> list) {
    for (final Building building in list) {
      buildings[building.buildingType] = building;
    }
  }

  void update(double dt) {}
}
