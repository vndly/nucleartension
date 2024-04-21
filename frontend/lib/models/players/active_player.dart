import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/building_type.dart';

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
      switch (nextAction) {
        case PlayerAction.upgrade_power_plant:
          _upgradeBuilding(BuildingType.power_plant);
          break;
        case PlayerAction.upgrade_supply_center:
          _upgradeBuilding(BuildingType.supply_center);
          break;
        case PlayerAction.upgrade_tech_lab:
          _upgradeBuilding(BuildingType.tech_lab);
          break;
        case PlayerAction.upgrade_propaganda_station:
          _upgradeBuilding(BuildingType.propaganda_station);
          break;
        case PlayerAction.upgrade_military_facility:
          _upgradeBuilding(BuildingType.military_facility);
          break;
        case PlayerAction.upgrade_missile_silo:
          _upgradeBuilding(BuildingType.missile_silo);
          break;
        default: // TODO(momo): implement rest
          break;
      }
    }
  }

  void _upgradeBuilding(BuildingType buildingType) {
    // TODO(momo): implement
    final Building building = getBuilding(buildingType);
    building.upgrade();
  }
}

class PlayerProfile implements ProfileChoice {
  final List<ProbabilityAction> groups;

  const PlayerProfile._(this.groups);

  @override
  PlayerAction get action {
    return groups[0].action; // TODO(momo): implement
  }

  factory PlayerProfile.aggressive() => PlayerProfile._([
        ProbabilityAction(
          probability: 0.35,
          profileChoice: PlayerProfile._(_upgradeBuildingActions()),
        ),
        ProbabilityAction(
          probability: 0.25,
          profileChoice: PlayerProfile._(_researchTechnologyActions()),
        ),
        ProbabilityAction(
          probability: 0.20,
          profileChoice: PlayerProfile._(_createUnitAction()),
        ),
        ProbabilityAction(
          probability: 0.15,
          profileChoice: PlayerProfile._(_createMissileAction()),
        ),
        ProbabilityAction(
          probability: 0.5,
          profileChoice: PlayerProfile._(_attackAction()),
        ),
      ]);

  static List<ProbabilityAction> _upgradeBuildingActions() => _probabilities({
        PlayerAction.upgrade_power_plant: 0.3,
        PlayerAction.upgrade_supply_center: 0.25,
        PlayerAction.upgrade_tech_lab: 0.15,
        PlayerAction.upgrade_propaganda_station: 0.1,
        PlayerAction.upgrade_military_facility: 0.1,
        PlayerAction.upgrade_missile_silo: 0.1,
      });

  // TODO(momo): implement
  static List<ProbabilityAction> _researchTechnologyActions() => [];

  static List<ProbabilityAction> _createUnitAction() => _probabilities({
        PlayerAction.create_infantry: 0.4,
        PlayerAction.create_vehicle: 0.3,
        PlayerAction.create_aircraft: 0.2,
      });

  static List<ProbabilityAction> _createMissileAction() => _probabilities({
        PlayerAction.create_defense_missile: 0.7,
        PlayerAction.create_attack_missile: 0.3,
      });

  static List<ProbabilityAction> _attackAction() => _probabilities({
        PlayerAction.attack_unit: 0.5,
        PlayerAction.attack_missiles: 0.5,
      });

  static List<ProbabilityAction> _probabilities(
      Map<PlayerAction, double> probabilities) {
    final List<ProbabilityAction> result = [];

    for (final MapEntry<PlayerAction, double> entry in probabilities.entries) {
      result.add(ProbabilityAction(
        probability: entry.value,
        profileChoice: FinalAction(entry.key),
      ));
    }

    return result;
  }
}

abstract class ProfileChoice {
  PlayerAction get action;
}

class ProbabilityAction implements ProfileChoice {
  final double probability;
  final ProfileChoice profileChoice;

  const ProbabilityAction({
    required this.probability,
    required this.profileChoice,
  });

  @override
  PlayerAction get action => profileChoice.action;
}

class FinalAction implements ProfileChoice {
  final PlayerAction playerAction;

  const FinalAction(this.playerAction);

  @override
  PlayerAction get action => playerAction;
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

  // attack
  attack_unit,
  attack_missiles,
}
