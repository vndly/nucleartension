import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/unit_type.dart';

class ActivePlayer extends Player {
  final PlayerProfile profile;
  PlayerAction? nextAction;

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
    nextAction ??= profile.action;

    if (nextAction != null) {
      _executeAction(nextAction!);
    }
  }

  void _executeAction(PlayerAction playerAction) {
    switch (playerAction) {
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
      default: // `TODO`(momo): implement rest
        break;
    }
  }

  void _upgradeBuilding(Building building) {
    if (building.canUpgrade) {
      building.upgrade();
    }
  }

  void _createUnit(UnitType unitType) {
    switch (unitType) {
      case UnitType.defense:
      case UnitType.attack:
        missileSilo.enqueueUnit(unitType);
        break;
      case UnitType.infantry:
      case UnitType.vehicle:
      case UnitType.aircraft:
        militaryFacility.enqueueUnit(unitType);
        break;
    }
  }
}

class PlayerProfile implements ProfileChoice {
  final Map<ProfileChoice, double> map;

  const PlayerProfile._(this.map);

  @override
  PlayerAction get action {
    return map.keys.first.action; // TODO(momo): implement
  }

  factory PlayerProfile.aggressive() => PlayerProfile._({
        PlayerProfile.upgradeBuildingActions(): 0.35,
        PlayerProfile.researchTechnologyActions(): 0.25,
        PlayerProfile.createUnitAction(): 0.20,
        PlayerProfile.createMissileAction(): 0.15,
        PlayerProfile.attackAction(): 0.5,
      });

  factory PlayerProfile.upgradeBuildingActions() => PlayerProfile.finalActions({
        PlayerAction.upgrade_power_plant: 0.3,
        PlayerAction.upgrade_supply_center: 0.25,
        PlayerAction.upgrade_tech_lab: 0.15,
        PlayerAction.upgrade_propaganda_station: 0.1,
        PlayerAction.upgrade_military_facility: 0.1,
        PlayerAction.upgrade_missile_silo: 0.1,
      });

  // TODO(momo): implement
  factory PlayerProfile.researchTechnologyActions() =>
      PlayerProfile.finalActions({
        PlayerAction.research_resources_grid_management: 1,
      });

  factory PlayerProfile.createUnitAction() => PlayerProfile.finalActions({
        PlayerAction.create_infantry: 0.4,
        PlayerAction.create_vehicle: 0.3,
        PlayerAction.create_aircraft: 0.2,
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

  // create units
  create_infantry,
  create_vehicle,
  create_aircraft,

  // create missiles
  create_defense_missile,
  create_attack_missile,

  // research technology
  research_resources_grid_management,
  // TODO(momo): implement

  // attack
  attack_unit,
  attack_missiles,
}
