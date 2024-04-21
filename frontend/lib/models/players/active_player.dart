import 'package:nucleartension/models/players/player.dart';

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
    // TODO(momo): implement
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

  static List<ProbabilityAction> _upgradeBuildingActions() => [
        const ProbabilityAction(
          probability: 0.3,
          profileChoice: FinalAction(PlayerAction.upgrade_power_plant),
        ),
        const ProbabilityAction(
          probability: 0.25,
          profileChoice: FinalAction(PlayerAction.upgrade_supply_center),
        ),
        const ProbabilityAction(
          probability: 0.15,
          profileChoice: FinalAction(PlayerAction.upgrade_tech_lab),
        ),
        const ProbabilityAction(
          probability: 0.1,
          profileChoice: FinalAction(PlayerAction.upgrade_propaganda_station),
        ),
        const ProbabilityAction(
          probability: 0.1,
          profileChoice: FinalAction(PlayerAction.upgrade_military_facility),
        ),
        const ProbabilityAction(
          probability: 0.1,
          profileChoice: FinalAction(PlayerAction.upgrade_missile_silo),
        ),
      ];

  static List<ProbabilityAction> _researchTechnologyActions() => [];

  static List<ProbabilityAction> _createUnitAction() => [
        const ProbabilityAction(
          probability: 0.4,
          profileChoice: FinalAction(PlayerAction.create_infantry),
        ),
        const ProbabilityAction(
          probability: 0.3,
          profileChoice: FinalAction(PlayerAction.create_vehicle),
        ),
        const ProbabilityAction(
          probability: 0.2,
          profileChoice: FinalAction(PlayerAction.create_aircraft),
        ),
      ];

  static List<ProbabilityAction> _createMissileAction() => [
        const ProbabilityAction(
          probability: 0.7,
          profileChoice: FinalAction(PlayerAction.create_defense_missile),
        ),
        const ProbabilityAction(
          probability: 0.3,
          profileChoice: FinalAction(PlayerAction.create_attack_missile),
        ),
      ];

  static List<ProbabilityAction> _attackAction() => [
        const ProbabilityAction(
          probability: 0.5,
          profileChoice: FinalAction(PlayerAction.attack_unit),
        ),
        const ProbabilityAction(
          probability: 0.5,
          profileChoice: FinalAction(PlayerAction.attack_missiles),
        ),
      ];
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
