import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/military_type.dart';
import 'package:nucleartension/types/research_type.dart';
import 'package:nucleartension/utils/probability.dart';

class ActivePlayer extends Player {
  final PlayerProfile profile;
  PlayerAction? nextCreateAction;
  PlayerAction? nextResearchAction;
  PlayerAction? nextAttackAction;

  ActivePlayer({
    required super.game,
    required super.name,
    required super.country,
    required super.resources,
    required super.military,
    required super.buildings,
    required super.researches,
    required this.profile,
  });

  @override
  void takeAction() {
    nextCreateAction ??= profile.createAction(this);
    nextResearchAction ??= profile.researchAction(this);
    nextAttackAction ??= profile.attackAction(this);

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
      case PlayerAction.create_troop:
        _createTroop(MilitaryType.troop);
        break;
      case PlayerAction.create_defense_missile:
        _createMissile(MilitaryType.missile_defense);
        break;
      case PlayerAction.create_attack_missile:
        _createMissile(MilitaryType.missile_attack);
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
      case PlayerAction.research_missiles_active_tracking:
        _researchTechnology(ResearchType.missiles_active_tracking);
        break;
      case PlayerAction.research_missiles_signal_jamming:
        _researchTechnology(ResearchType.missiles_signal_jamming);
        break;
      case PlayerAction.research_missiles_nuclear_bomb:
        _researchTechnology(ResearchType.missiles_nuclear_bomb);
        break;
      case PlayerAction.research_troop_cost:
        _researchTechnology(ResearchType.troop_cost);
        break;
      case PlayerAction.attack_troop:
        troopAttack();
        break;
      case PlayerAction.attack_missile:
        _missileAttack();
        break;
    }
  }

  void _upgradeBuilding(Building building) {
    if (building.isUpgrading) {
      nextCreateAction = null;
      return;
    }

    if (building.level > _buildingMaxLevel(building.buildingType)) {
      nextCreateAction = null;
      return;
    }

    if (building.upgrade()) {
      nextCreateAction = null;
      debugPrint(
          'AI: Player $name upgraded building ${building.buildingType.name} to level ${building.level + 1}');
    }
  }

  int _buildingMaxLevel(BuildingType buildingType) {
    switch (buildingType) {
      case BuildingType.power_plant:
      case BuildingType.supply_center:
        return 4;
      case BuildingType.tech_lab:
        return 3;
      case BuildingType.propaganda_station:
        return 2;
      case BuildingType.military_facility:
      case BuildingType.missile_silo:
        return 1;
    }
  }

  void _createTroop(MilitaryType militaryType) {
    if (militaryFacility.level == 0) {
      nextCreateAction = null;
      return;
    }

    if (militaryFacility.enqueueMilitary(militaryType)) {
      nextCreateAction = null;
      debugPrint('AI: Player $name enqueued troop');
    }
  }

  void _createMissile(MilitaryType militaryType) {
    final nuclearBombResearch =
        getResearch(ResearchType.missiles_nuclear_bomb).level;

    if ((militaryType == MilitaryType.missile_attack) &&
        (nuclearBombResearch == 0)) {
      nextCreateAction = null;
      return;
    }

    if (missileSilo.level == 0) {
      nextCreateAction = null;
      return;
    }

    if (missileSilo.enqueueMilitary(militaryType)) {
      nextCreateAction = null;
      debugPrint('AI: Player $name enqueued missile ${militaryType.name}');
    }
  }

  void _researchTechnology(ResearchType researchType) {
    final Research research = getResearch(researchType);

    if (!research.canBeResearched) {
      nextResearchAction = null;
      return;
    }

    if (research.upgrade()) {
      nextResearchAction = null;
      debugPrint(
          'AI: Player $name upgraded research ${research.researchType.name} to level ${research.level + 1}');
    }
  }

  void troopAttack() {
    if (troops > 0) {
      final Player? defender = game.randomPlayer(this);
      final int amount = Probability.between(1, troops);

      if ((amount > 0) && (defender != null)) {
        debugPrint(
            'AI: Player $name sent troop attack to ${defender.name} with $amount');
        game.troopAttack(
          attacker: this,
          defender: defender,
          amount: amount,
        );
      }

      nextAttackAction = null;
    }
  }

  void _missileAttack() {
    if (attackMissiles > 0) {
      final Player? defender = game.randomPlayer(this);
      final int amount = Probability.between(1, attackMissiles);

      if ((amount > 0) && (defender != null)) {
        debugPrint(
            'AI: Player $name sent missile attack to ${defender.name} with $amount');
        game.missileAttack(
          attacker: this,
          defender: defender,
          amount: amount,
        );
      }

      nextAttackAction = null;
    }
  }
}

class PlayerProfile {
  final ActionChoice createProfile;
  final ActionChoice researchProfile;
  final ActionChoice attackProfile;

  const PlayerProfile._({
    required this.createProfile,
    required this.researchProfile,
    required this.attackProfile,
  });

  PlayerAction? createAction(Player player) => createProfile.action(player);

  PlayerAction? researchAction(Player player) => researchProfile.action(player);

  PlayerAction? attackAction(Player player) => attackProfile.action(player);

  factory PlayerProfile.aggressiveTroops() => PlayerProfile._(
        createProfile: CreateProfile.aggressiveTroops(),
        researchProfile: ResearchProfile.aggressiveTroops(),
        attackProfile: AttackProfile.aggressiveTroop(),
      );

  factory PlayerProfile.aggressiveMissiles() => PlayerProfile._(
        createProfile: CreateProfile.aggressiveMissiles(),
        researchProfile: ResearchProfile.aggressiveMissiles(),
        attackProfile: AttackProfile.aggressiveMissiles(),
      );

  factory PlayerProfile.aggressiveMix() => PlayerProfile._(
        createProfile: CreateProfile.aggressiveMix(),
        researchProfile: ResearchProfile.aggressiveMissiles(),
        attackProfile: AttackProfile.aggressiveMix(),
      );

  factory PlayerProfile.neutral() => PlayerProfile._(
        createProfile: CreateProfile.neutral(),
        researchProfile: ResearchProfile.neutral(),
        attackProfile: AttackProfile.neutral(),
      );

  factory PlayerProfile.defensive() => PlayerProfile._(
        createProfile: CreateProfile.defensive(),
        researchProfile: ResearchProfile.defensive(),
        attackProfile: AttackProfile.defensive(),
      );
}

class CreateProfile extends ProbabilityProfile {
  const CreateProfile._(super.map);

  factory CreateProfile.aggressiveTroops() => CreateProfile._({
        CreateProfile.upgradeBuildingAggressiveActions(): 0.4,
        CreateProfile.createTroopAction(): 0.4,
        CreateProfile.createMissileMixAction(): 0.2,
      });

  factory CreateProfile.aggressiveMissiles() => CreateProfile._({
        CreateProfile.upgradeBuildingAggressiveActions(): 0.4,
        CreateProfile.createTroopAction(): 0.2,
        CreateProfile.createMissileAggressiveAction(): 0.4,
      });

  factory CreateProfile.aggressiveMix() => CreateProfile._({
        CreateProfile.upgradeBuildingAggressiveActions(): 0.4,
        CreateProfile.createTroopAction(): 0.3,
        CreateProfile.createMissileMixAction(): 0.3,
      });

  factory CreateProfile.neutral() => CreateProfile._({
        CreateProfile.upgradeBuildingNeutralActions(): 0.6,
        CreateProfile.createTroopAction(): 0.2,
        CreateProfile.createMissileMixAction(): 0.2,
      });

  factory CreateProfile.defensive() => CreateProfile._({
        CreateProfile.upgradeBuildingDefensiveActions(): 0.6,
        CreateProfile.createTroopAction(): 0.1,
        CreateProfile.createMissileDefensiveAction(): 0.3,
      });

  factory CreateProfile.upgradeBuildingAggressiveActions() =>
      CreateProfile._(ProbabilityProfile.actions({
        PlayerAction.upgrade_power_plant: 0.3,
        PlayerAction.upgrade_supply_center: 0.3,
        PlayerAction.upgrade_tech_lab: 0.1,
        PlayerAction.upgrade_propaganda_station: 0.1,
        PlayerAction.upgrade_military_facility: 0.1,
        PlayerAction.upgrade_missile_silo: 0.1,
      }));

  factory CreateProfile.upgradeBuildingNeutralActions() =>
      CreateProfile._(ProbabilityProfile.actions({
        PlayerAction.upgrade_power_plant: 0.3,
        PlayerAction.upgrade_supply_center: 0.3,
        PlayerAction.upgrade_tech_lab: 0.15,
        PlayerAction.upgrade_propaganda_station: 0.15,
        PlayerAction.upgrade_military_facility: 0.05,
        PlayerAction.upgrade_missile_silo: 0.05,
      }));

  factory CreateProfile.upgradeBuildingDefensiveActions() =>
      CreateProfile._(ProbabilityProfile.actions({
        PlayerAction.upgrade_power_plant: 0.3,
        PlayerAction.upgrade_supply_center: 0.3,
        PlayerAction.upgrade_tech_lab: 0.1,
        PlayerAction.upgrade_propaganda_station: 0.2,
        PlayerAction.upgrade_military_facility: 0.05,
        PlayerAction.upgrade_missile_silo: 0.05,
      }));

  factory CreateProfile.createTroopAction() =>
      CreateProfile._(ProbabilityProfile.actions({
        PlayerAction.create_troop: 1,
      }));

  factory CreateProfile.createMissileAggressiveAction() =>
      CreateProfile._(ProbabilityProfile.actions({
        PlayerAction.create_defense_missile: 0.2,
        PlayerAction.create_attack_missile: 0.8,
      }));

  factory CreateProfile.createMissileDefensiveAction() =>
      CreateProfile._(ProbabilityProfile.actions({
        PlayerAction.create_defense_missile: 0.8,
        PlayerAction.create_attack_missile: 0.2,
      }));

  factory CreateProfile.createMissileMixAction() =>
      CreateProfile._(ProbabilityProfile.actions({
        PlayerAction.create_defense_missile: 0.6,
        PlayerAction.create_attack_missile: 0.4,
      }));
}

class ResearchProfile extends ProbabilityProfile {
  const ResearchProfile._(super.map);

  factory ResearchProfile.aggressiveTroops() =>
      ResearchProfile._(ProbabilityProfile.actions({
        PlayerAction.research_resources_grid_management: 0.2,
        PlayerAction.research_resources_production_chain: 0.2,
        PlayerAction.research_resources_quantum_computing: 0.2,
        PlayerAction.research_resources_indoctrination: 0.06,
        PlayerAction.research_missiles_additive_manufacturing: 0.01,
        PlayerAction.research_missiles_active_tracking: 0.01,
        PlayerAction.research_missiles_signal_jamming: 0.01,
        PlayerAction.research_missiles_nuclear_bomb: 0.01,
        PlayerAction.research_troop_cost: 0.3,
      }));

  factory ResearchProfile.aggressiveMissiles() =>
      ResearchProfile._(ProbabilityProfile.actions({
        PlayerAction.research_resources_grid_management: 0.1,
        PlayerAction.research_resources_production_chain: 0.1,
        PlayerAction.research_resources_quantum_computing: 0.1,
        PlayerAction.research_resources_indoctrination: 0.04,
        PlayerAction.research_missiles_additive_manufacturing: 0.1,
        PlayerAction.research_missiles_active_tracking: 0.1,
        PlayerAction.research_missiles_signal_jamming: 0.2,
        PlayerAction.research_missiles_nuclear_bomb: 0.2,
        PlayerAction.research_troop_cost: 0.06,
      }));

  factory ResearchProfile.aggressiveMix() =>
      ResearchProfile._(ProbabilityProfile.actions({
        PlayerAction.research_resources_grid_management: 0.1,
        PlayerAction.research_resources_production_chain: 0.1,
        PlayerAction.research_resources_quantum_computing: 0.1,
        PlayerAction.research_resources_indoctrination: 0.1,
        PlayerAction.research_missiles_additive_manufacturing: 0.09,
        PlayerAction.research_missiles_active_tracking: 0.09,
        PlayerAction.research_missiles_signal_jamming: 0.09,
        PlayerAction.research_missiles_nuclear_bomb: 0.09,
        PlayerAction.research_troop_cost: 0.24,
      }));

  factory ResearchProfile.neutral() =>
      ResearchProfile._(ProbabilityProfile.actions({
        PlayerAction.research_resources_grid_management: 0.1,
        PlayerAction.research_resources_production_chain: 0.1,
        PlayerAction.research_resources_quantum_computing: 0.1,
        PlayerAction.research_resources_indoctrination: 0.1,
        PlayerAction.research_missiles_additive_manufacturing: 0.08,
        PlayerAction.research_missiles_active_tracking: 0.08,
        PlayerAction.research_missiles_signal_jamming: 0.08,
        PlayerAction.research_missiles_nuclear_bomb: 0.12,
        PlayerAction.research_troop_cost: 0.24,
      }));

  factory ResearchProfile.defensive() =>
      ResearchProfile._(ProbabilityProfile.actions({
        PlayerAction.research_resources_grid_management: 0.1,
        PlayerAction.research_resources_production_chain: 0.1,
        PlayerAction.research_resources_quantum_computing: 0.1,
        PlayerAction.research_resources_indoctrination: 0.2,
        PlayerAction.research_missiles_additive_manufacturing: 0.04,
        PlayerAction.research_missiles_active_tracking: 0.2,
        PlayerAction.research_missiles_signal_jamming: 0.04,
        PlayerAction.research_missiles_nuclear_bomb: 0.04,
        PlayerAction.research_troop_cost: 0.18,
      }));
}

class ProbabilityProfile implements ActionChoice {
  final Map<ActionChoice, num> map;

  const ProbabilityProfile(this.map);

  @override
  PlayerAction? action(Player player) => Probability.choose(map).action(player);

  static Map<ActionChoice, double> actions(Map<PlayerAction, double> map) {
    final Map<ActionChoice, double> result = {};
    double sum = 0;

    for (final MapEntry<PlayerAction, double> entry in map.entries) {
      result[FinalAction(entry.key)] = entry.value;
      sum += entry.value;
    }

    if (!Probability.equals(sum, 1)) {
      throw Exception('Probabilities do not add up to 1');
    }

    return result;
  }
}

class AttackProfile implements ActionChoice {
  final int minTroopAttack;
  final int minMissileAttack;

  const AttackProfile._(this.minTroopAttack, this.minMissileAttack);

  @override
  PlayerAction? action(Player player) {
    if (player.troops >= minTroopAttack) {
      return PlayerAction.attack_troop;
    } else if (player.attackMissiles >= minMissileAttack) {
      return PlayerAction.attack_missile;
    } else {
      return null;
    }
  }

  factory AttackProfile.aggressiveTroop() => const AttackProfile._(5, 10);

  factory AttackProfile.aggressiveMissiles() => const AttackProfile._(10, 5);

  factory AttackProfile.aggressiveMix() => const AttackProfile._(5, 5);

  factory AttackProfile.neutral() => const AttackProfile._(10, 10);

  factory AttackProfile.defensive() => const AttackProfile._(20, 20);
}

class FinalAction implements ActionChoice {
  final PlayerAction playerAction;

  const FinalAction(this.playerAction);

  @override
  PlayerAction action(Player player) => playerAction;
}

abstract class ActionChoice {
  PlayerAction? action(Player player);
}

enum PlayerAction {
  // building upgrades
  upgrade_power_plant,
  upgrade_supply_center,
  upgrade_tech_lab,
  upgrade_propaganda_station,
  upgrade_military_facility,
  upgrade_missile_silo,

  // create troop
  create_troop,

  // create missiles
  create_defense_missile,
  create_attack_missile,

  // research technology
  research_resources_grid_management,
  research_resources_production_chain,
  research_resources_quantum_computing,
  research_resources_indoctrination,
  research_missiles_additive_manufacturing,
  research_missiles_active_tracking,
  research_missiles_signal_jamming,
  research_missiles_nuclear_bomb,
  research_troop_cost,

  // attack
  attack_troop,
  attack_missile,
}
