import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/research_type.dart';
import 'package:nucleartension/types/unit_type.dart';
import 'package:nucleartension/utils/probability.dart';

class ActivePlayer extends Player {
  final PlayerProfile profile;

  ActivePlayer({
    required super.game,
    required super.name,
    required super.country,
    required super.resources,
    required super.buildings,
    required super.researches,
    required super.military,
    required this.profile,
  });

  @override
  void takeAction() {
    final PlayerAction action = profile.action;

    switch (action) {
      case PlayerAction.upgrade_power_plant:
        _upgradeBuilding(powerPlant);
        break;
      case PlayerAction.upgrade_supply_center:
        _upgradeBuilding(supplyCenter);
        break;
      case PlayerAction.upgrade_tech_lab:
        _upgradeBuilding(techLab);
        break;
      case PlayerAction.upgrade_propaganda_station:
        _upgradeBuilding(propagandaStation);
        break;
      case PlayerAction.upgrade_military_facility:
        _upgradeBuilding(militaryFacility);
        break;
      case PlayerAction.upgrade_missile_silo:
        _upgradeBuilding(missileSilo);
        break;
      case PlayerAction.research_resources_grid_management:
        _researchTechnology(ResearchType.resources_grid_management);
        break;
      case PlayerAction.research_resources_production_chain:
        _researchTechnology(ResearchType.resources_production_chain);
        break;
      case PlayerAction.research_resources_indoctrination:
        _researchTechnology(ResearchType.resources_indoctrination);
        break;
      case PlayerAction.research_resources_quantum_computing:
        _researchTechnology(ResearchType.resources_quantum_computing);
        break;
      case PlayerAction.research_missiles_additive_manufacturing:
        _researchTechnology(ResearchType.missiles_additive_manufacturing);
        break;
      case PlayerAction.research_missiles_assembly_automation:
        _researchTechnology(ResearchType.missiles_assembly_automation);
        break;
      case PlayerAction.research_missiles_active_tracking:
        _researchTechnology(ResearchType.missiles_active_tracking);
        break;
      case PlayerAction.research_missiles_signal_jamming:
        _researchTechnology(ResearchType.missiles_signal_jamming);
        break;
      case PlayerAction.research_unit_infantry_cost:
        _researchTechnology(ResearchType.unit_infantry_cost);
        break;
      case PlayerAction.research_unit_infantry_time:
        _researchTechnology(ResearchType.unit_infantry_time);
        break;
      case PlayerAction.research_unit_vehicles_cost:
        _researchTechnology(ResearchType.unit_vehicles_cost);
        break;
      case PlayerAction.research_unit_vehicles_time:
        _researchTechnology(ResearchType.unit_vehicles_time);
        break;
      case PlayerAction.research_unit_aircraft_cost:
        _researchTechnology(ResearchType.unit_aircraft_cost);
        break;
      case PlayerAction.research_unit_aircraft_time:
        _researchTechnology(ResearchType.unit_aircraft_time);
        break;
      case PlayerAction.research_weapons_nuclear_bomb:
        _researchTechnology(ResearchType.weapons_nuclear_bomb);
        break;
      case PlayerAction.create_infantry:
        _createUnit(UnitType.infantry);
        break;
      case PlayerAction.create_vehicle:
        _createUnit(UnitType.vehicle);
        break;
      case PlayerAction.create_aircraft:
        _createUnit(UnitType.aircraft);
        break;
      case PlayerAction.create_defense_missile:
        _createUnit(UnitType.defense);
        break;
      case PlayerAction.create_attack_missile:
        _createUnit(UnitType.attack);
        break;
      case PlayerAction.attack_unit:
        _uniAttack();
        break;
      case PlayerAction.attack_missiles:
        _missileAttack();
        break;
    }
  }

  void _upgradeBuilding(Building building) {
    if (building.canUpgrade) {
      building.upgrade();
      debugPrint(
          'AI: Player $name upgraded building ${building.buildingType.name} to level ${building.level + 1}');
    }
  }

  void _researchTechnology(ResearchType researchType) {
    final Research research = getResearch(researchType);

    if (!research.isMax && research.canUpgrade) {
      research.upgrade();
      debugPrint(
          'AI: Player $name upgraded research ${research.researchType.name} to level ${research.level + 1}');
    }
  }

  void _createUnit(UnitType unitType) {
    switch (unitType) {
      case UnitType.defense:
      case UnitType.attack:
        if (missileSilo.canCreateUnit(unitType)) {
          missileSilo.enqueueUnit(unitType);
          debugPrint('AI: Player $name enqueued unit ${unitType.name}');
        }
        break;
      case UnitType.infantry:
      case UnitType.vehicle:
      case UnitType.aircraft:
        if (missileSilo.canCreateUnit(unitType)) {
          militaryFacility.enqueueUnit(unitType);
          debugPrint('AI: Player $name enqueued unit ${unitType.name}');
        }
        break;
    }
  }

  void _uniAttack() {
    // TODO(momo): implement
    // 1. choose player
    // 2. choose military power
  }

  void _missileAttack() {
    // TODO(momo): implement
    // 1. choose player
    // 2. choose amount of missiles
  }
}

class PlayerProfile implements ProfileChoice {
  final Map<ProfileChoice, num> map;

  const PlayerProfile._(this.map);

  @override
  PlayerAction get action => Probability.choose(map).action;

  factory PlayerProfile.aggressive() => PlayerProfile._({
        PlayerProfile.upgradeBuildingActions(): 0.35,
        PlayerProfile.researchTechnologyActions(): 0.25,
        PlayerProfile.createUnitAction(): 0.20,
        PlayerProfile.createMissileAction(): 0.15,
        PlayerProfile.attackAction(): 0.05,
      });

  factory PlayerProfile.upgradeBuildingActions() => PlayerProfile.finalActions({
        PlayerAction.upgrade_power_plant: 0.3,
        PlayerAction.upgrade_supply_center: 0.25,
        PlayerAction.upgrade_tech_lab: 0.15,
        PlayerAction.upgrade_propaganda_station: 0.1,
        PlayerAction.upgrade_military_facility: 0.1,
        PlayerAction.upgrade_missile_silo: 0.1,
      });

  factory PlayerProfile.researchTechnologyActions() =>
      PlayerProfile.finalActions({
        PlayerAction.research_resources_grid_management: 0.1,
        PlayerAction.research_resources_production_chain: 0.1,
        PlayerAction.research_resources_indoctrination: 0.1,
        PlayerAction.research_resources_quantum_computing: 0.1,
        PlayerAction.research_missiles_additive_manufacturing: 0.05,
        PlayerAction.research_missiles_assembly_automation: 0.05,
        PlayerAction.research_missiles_active_tracking: 0.05,
        PlayerAction.research_missiles_signal_jamming: 0.05,
        PlayerAction.research_unit_infantry_cost: 0.05,
        PlayerAction.research_unit_infantry_time: 0.05,
        PlayerAction.research_unit_vehicles_cost: 0.05,
        PlayerAction.research_unit_vehicles_time: 0.05,
        PlayerAction.research_unit_aircraft_cost: 0.05,
        PlayerAction.research_unit_aircraft_time: 0.05,
        PlayerAction.research_weapons_nuclear_bomb: 0.1,
      });

  factory PlayerProfile.createUnitAction() => PlayerProfile.finalActions({
        PlayerAction.create_infantry: 0.4,
        PlayerAction.create_vehicle: 0.35,
        PlayerAction.create_aircraft: 0.25,
      });

  factory PlayerProfile.createMissileAction() => PlayerProfile.finalActions({
        PlayerAction.create_defense_missile: 0.7,
        PlayerAction.create_attack_missile: 0.3,
      });

  factory PlayerProfile.attackAction() => PlayerProfile.finalActions({
        PlayerAction.attack_unit: 0.5,
        PlayerAction.attack_missiles: 0.5,
      });

  factory PlayerProfile.finalActions(Map<PlayerAction, double> map) {
    final Map<ProfileChoice, double> result = {};

    for (final MapEntry<PlayerAction, double> entry in map.entries) {
      result[FinalAction(entry.key)] = entry.value;
    }

    return PlayerProfile._(result);
  }
}

class FinalAction implements ProfileChoice {
  final PlayerAction playerAction;

  const FinalAction(this.playerAction);

  @override
  PlayerAction get action => playerAction;
}

abstract class ProfileChoice {
  PlayerAction get action;
}

enum PlayerAction {
  // building upgrades
  upgrade_power_plant,
  upgrade_supply_center,
  upgrade_tech_lab,
  upgrade_propaganda_station,
  upgrade_military_facility,
  upgrade_missile_silo,

  // research technology
  research_resources_grid_management,
  research_resources_production_chain,
  research_resources_indoctrination,
  research_resources_quantum_computing,
  research_missiles_additive_manufacturing,
  research_missiles_assembly_automation,
  research_missiles_active_tracking,
  research_missiles_signal_jamming,
  research_unit_infantry_cost,
  research_unit_infantry_time,
  research_unit_vehicles_cost,
  research_unit_vehicles_time,
  research_unit_aircraft_cost,
  research_unit_aircraft_time,
  research_weapons_nuclear_bomb,

  // create units
  create_infantry,
  create_vehicle,
  create_aircraft,

  // create missiles
  create_defense_missile,
  create_attack_missile,

  // attack
  attack_unit,
  attack_missiles,
}
