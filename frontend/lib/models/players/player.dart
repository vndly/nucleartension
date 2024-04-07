import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/inventory/military_inventory.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/military_type.dart';
import 'package:nucleartension/types/research_type.dart';

class Player {
  final Game game;
  final String name;
  final Color color;
  final ResourceInventory resources;
  final MilitaryInventory military;
  final Map<BuildingType, Building> buildings;
  final Map<ResearchType, Research> researches;

  const Player({
    required this.game,
    required this.name,
    required this.color,
    required this.resources,
    required this.buildings,
    required this.researches,
    required this.military,
  });

  // ============================ MILITARY ================================== \\

  int get militaryPower => military.get(MilitaryType.power).toInt();

  int get militaryDefenseMissiles =>
      military.get(MilitaryType.defense_missiles).toInt();

  int get militaryAttackMissiles =>
      military.get(MilitaryType.attack_missiles).toInt();

  bool get hasMilitaryPower => militaryPower > 0;

  bool get hasAttackMissiles => militaryAttackMissiles > 0;

  // ============================== OTHER =================================== \\

  void addBuildings(List<Building> list) {
    for (final Building building in list) {
      buildings[building.buildingType] = building;
    }
  }

  void addResearches(List<Research> list) {
    for (final Research research in list) {
      researches[research.researchType] = research;
    }
  }

  void update(double dt) {}
}
