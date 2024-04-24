import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/research_type.dart';
import 'package:nucleartension/types/unit_type.dart';
import 'package:nucleartension/utils/probability.dart';

class ActivePlayer extends Player {
  final ActionChoice createProfile;
  final ActionChoice researchProfile;
  final ActionChoice attackProfile;
  PlayerAction? nextCreateAction;
  PlayerAction? nextResearchAction;
  PlayerAction? nextAttackAction;

  ActivePlayer({
    required super.game,
    required super.name,
    required super.country,
    required super.resources,
    required super.buildings,
    required super.researches,
    required super.military,
    required this.createProfile,
    required this.researchProfile,
    required this.attackProfile,
  });

  @override
  void takeAction() {
    nextCreateAction ??= createProfile.action(this);
    nextResearchAction ??= researchProfile.action(this);
    nextAttackAction ??= attackProfile.action(this);

    if (nextCreateAction != null) {
      _processAction(nextCreateAction!);
    }

    if (nextResearchAction != null) {
      _processAction(nextResearchAction!);
    }

    if (nextAttackAction != null) {
      _processAction(nextAttackAction!);
    }
  }

  void _processAction(PlayerAction action) {
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
      case PlayerAction.create_infantry:
        _createMilitary(UnitType.infantry);
        break;
      case PlayerAction.create_vehicle:
        _createMilitary(UnitType.vehicle);
        break;
      case PlayerAction.create_aircraft:
        _createMilitary(UnitType.aircraft);
        break;
      case PlayerAction.create_defense_missile:
        _createMilitary(UnitType.missile_defense);
        break;
      case PlayerAction.create_attack_missile:
        _createMilitary(UnitType.missile_attack);
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
      case PlayerAction.attack_unit:
        _uniAttack();
        break;
      case PlayerAction.attack_missile:
        _missileAttack();
        break;
    }
  }

  void _upgradeBuilding(Building building) {
    if (building.upgrade()) {
      debugPrint(
          'AI: Player $name upgraded building ${building.buildingType.name} to level ${building.level + 1}');
    }
  }

  void _createMilitary(UnitType unitType) {
    switch (unitType) {
      case UnitType.infantry:
      case UnitType.vehicle:
      case UnitType.aircraft:
        _createUnit(unitType);
        break;
      case UnitType.missile_defense:
      case UnitType.missile_attack:
        _createMissile(unitType);
        break;
    }
  }

  void _createUnit(UnitType unitType) {
    if (militaryFacility.enqueueUnit(unitType)) {
      debugPrint('AI: Player $name enqueued unit ${unitType.name}');
    }
  }

  void _createMissile(UnitType unitType) {
    final nuclearBombResearch =
        getResearch(ResearchType.weapons_nuclear_bomb).level;

    if ((unitType == UnitType.missile_attack) && (nuclearBombResearch == 0)) {
      return;
    }

    if (missileSilo.enqueueUnit(unitType)) {
      debugPrint('AI: Player $name enqueued missile ${unitType.name}');
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

  void _uniAttack() {
    if (militaryPower > 10) {
      final Player? defender = game.randomPlayer(this);
      final int amount = Probability.between(1, militaryPower);

      if (defender != null) {
        debugPrint(
            'AI: Player $name sent unit attack to ${defender.name} with $amount');
        game.unitAttack(
          attacker: this,
          defender: defender,
          militaryPower: amount,
        );
      }
    }
  }

  void _missileAttack() {
    if (militaryAttackMissiles > 10) {
      final Player? defender = game.randomPlayer(this);
      final int amount = Probability.between(1, militaryAttackMissiles);

      if (defender != null) {
        debugPrint(
            'AI: Player $name sent missile attack to ${defender.name} with $amount');
        game.missileAttack(
          attacker: this,
          defender: defender,
          amount: amount,
        );
      }
    }
  }
}

class CreateProfile extends ProbabilityProfile {
  const CreateProfile._(super.map);

  factory CreateProfile.aggressive() => CreateProfile._({
        CreateProfile.upgradeBuildingActions(): 0.6,
        CreateProfile.createUnitAction(): 0.2,
        CreateProfile.createMissileAction(): 0.2,
      });

  factory CreateProfile.upgradeBuildingActions() =>
      CreateProfile._(ProbabilityProfile.actions({
        PlayerAction.upgrade_power_plant: 0.3,
        PlayerAction.upgrade_supply_center: 0.3,
        PlayerAction.upgrade_tech_lab: 0.15,
        PlayerAction.upgrade_propaganda_station: 0.15,
        PlayerAction.upgrade_military_facility: 0.05,
        PlayerAction.upgrade_missile_silo: 0.05,
      }));

  factory CreateProfile.createUnitAction() =>
      CreateProfile._(ProbabilityProfile.actions({
        PlayerAction.create_infantry: 0.4,
        PlayerAction.create_vehicle: 0.35,
        PlayerAction.create_aircraft: 0.25,
      }));

  factory CreateProfile.createMissileAction() =>
      CreateProfile._(ProbabilityProfile.actions({
        PlayerAction.create_defense_missile: 0.4,
        PlayerAction.create_attack_missile: 0.6,
      }));
}

class ResearchProfile extends ProbabilityProfile {
  const ResearchProfile._(super.map);

  factory ResearchProfile.aggressive() =>
      ResearchProfile._(ProbabilityProfile.actions({
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
      }));
}

class ProbabilityProfile implements ActionChoice {
  final Map<ActionChoice, num> map;

  const ProbabilityProfile(this.map);

  @override
  PlayerAction action(Player player) => Probability.choose(map).action(player);

  static Map<ActionChoice, double> actions(Map<PlayerAction, double> map) {
    final Map<ActionChoice, double> result = {};

    for (final MapEntry<PlayerAction, double> entry in map.entries) {
      result[FinalAction(entry.key)] = entry.value;
    }

    return result;
  }
}

class AttackProfile implements ActionChoice {
  final int minUnitAttack;
  final int minMissileAttack;

  const AttackProfile._(this.minUnitAttack, this.minMissileAttack);

  @override
  PlayerAction action(Player player) {
    return PlayerAction.attack_unit; // TODO(momo): implement
  }

  factory AttackProfile.aggressive() => const AttackProfile._(5, 5);
}

class FinalAction implements ActionChoice {
  final PlayerAction playerAction;

  const FinalAction(this.playerAction);

  @override
  PlayerAction action(Player player) => playerAction;
}

abstract class ActionChoice {
  PlayerAction action(Player player);
}

enum PlayerAction {
  // building upgrades
  upgrade_power_plant,
  upgrade_supply_center,
  upgrade_tech_lab,
  upgrade_propaganda_station,
  upgrade_military_facility,
  upgrade_missile_silo,

  // create units
  create_infantry,
  create_vehicle,
  create_aircraft,

  // create missiles
  create_defense_missile,
  create_attack_missile,

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

  // attack
  attack_unit,
  attack_missile,
}
