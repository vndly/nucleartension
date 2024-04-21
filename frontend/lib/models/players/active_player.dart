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

class PlayerProfile {
  final Map<FirstLevelAction, double> firstLevel;

  const PlayerProfile._({
    required this.firstLevel,
  });

  PlayerAction get action {
    return PlayerAction.upgrade_power_plant; // TODO(momo): implement
  }

  factory PlayerProfile.aggressive() => const PlayerProfile._(firstLevel: {
        FirstLevelAction.upgrade_building: 0.35,
        FirstLevelAction.research_technology: 0.25,
        FirstLevelAction.create_unit: 0.20,
        FirstLevelAction.create_missile: 0.15,
        FirstLevelAction.attack: 0.5,
      });
}

abstract class ProfileChoice {
  PlayerAction get action;
}

class GroupAction implements ProfileChoice {
  final List<ProbabilityAction> groups;

  const GroupAction(this.groups);

  @override
  PlayerAction get action {
    return groups[0].action; // TODO(momo): implement
  }

  List<ProfileChoice> test() => [
        const GroupAction([
          ProbabilityAction(
            probability: 0.35,
            profileChoice: GroupAction([
              ProbabilityAction(
                probability: 0.35,
                profileChoice:
                    FinalAction(playerAction: PlayerAction.upgrade_power_plant),
              ),
            ]),
          ),
        ]),
      ];
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

  const FinalAction({
    required this.playerAction,
  });

  @override
  PlayerAction get action => playerAction;
}

enum FirstLevelAction {
  upgrade_building,
  research_technology,
  create_unit,
  create_missile,
  attack;
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
