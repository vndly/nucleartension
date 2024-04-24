import 'dart:math';
import 'package:nucleartension/extensions/item_map_extension.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/upgradable.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/research_type.dart';

class Research extends Upgradable {
  final ResearchType researchType;

  Research({
    required super.player,
    required super.level,
    required this.researchType,
  });

  @override
  ResourceMap get upgradeCost => researchType.cost(level + 1);

  @override
  bool get canUpgrade => !isMax && super.canUpgrade;

  @override
  num get upgradeTime => upgradeCost.duration;

  bool get canBeResearched {
    final int buildingLevel =
        (buildingType != null) ? player.getBuilding(buildingType!).level : 1;

    return buildingLevel > 0;
  }

  bool get isMax => level >= researchType.maxLevel;

  double get rate => researchType.rate * level;

  double get increaseRate => rate + 1;

  double get decreaseRate => 1 - rate;

  BuildingType? get buildingType {
    switch (researchType) {
      case ResearchType.resources_grid_management:
        return BuildingType.power_plant;
      case ResearchType.resources_production_chain:
        return BuildingType.supply_center;
      case ResearchType.resources_indoctrination:
        return BuildingType.propaganda_station;
      case ResearchType.resources_quantum_computing:
        return BuildingType.tech_lab;
      case ResearchType.missiles_additive_manufacturing:
      case ResearchType.missiles_assembly_automation:
      case ResearchType.missiles_active_tracking:
      case ResearchType.missiles_signal_jamming:
      case ResearchType.warning_missiles_hypersonic_propulsion:
        return BuildingType.missile_silo;
      case ResearchType.warning_military_fast_deployments:
      case ResearchType.unit_infantry_cost:
      case ResearchType.unit_infantry_time:
      case ResearchType.unit_vehicles_cost:
      case ResearchType.unit_vehicles_time:
      case ResearchType.unit_aircraft_cost:
      case ResearchType.unit_aircraft_time:
        return BuildingType.military_facility;
      default:
        return null;
    }
  }

  // In kt
  static int yield(int level) {
    if (level <= 7) {
      return (pow(2, level - 1) * 10).toInt();
    } else {
      return (pow(2, level - 8) * 1000).toInt();
    }
  }
}
