import 'dart:math';
import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/models/buildings/producers/power_plant.dart';
import 'package:nucleartension/models/buildings/producers/producer.dart';
import 'package:nucleartension/models/buildings/producers/propaganda_station.dart';
import 'package:nucleartension/models/buildings/trainers/missile_silo.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/inventory/military_inventory.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/players/self_player.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/country.dart';
import 'package:nucleartension/types/military_type.dart';
import 'package:nucleartension/types/research_type.dart';
import 'package:nucleartension/types/resource_type.dart';

class Player {
  final MyGame game;
  final String name;
  final Country country;
  final ResourceInventory resources;
  final MilitaryInventory military;
  final Map<BuildingType, Building> buildings;
  final Map<ResearchType, Research> researches;

  const Player({
    required this.game,
    required this.name,
    required this.country,
    required this.resources,
    required this.buildings,
    required this.researches,
    required this.military,
  });

  bool get isSelf => this is SelfPlayer;

  bool get isAlive => population > 0;

  // ============================ BUILDINGS ================================= \\

  PowerPlant get powerPlant =>
      buildings[BuildingType.power_plant] as PowerPlant;

  PropagandaStation get propagandaStation =>
      buildings[BuildingType.propaganda_station] as PropagandaStation;

  MissileSilo get missileSilo =>
      buildings[BuildingType.missile_silo] as MissileSilo;

  Building getBuilding(BuildingType buildingType) => buildings[buildingType]!;

  void addBuildings(List<Building> list) {
    for (final Building building in list) {
      buildings[building.buildingType] = building;
    }
  }

  // ============================ RESEARCH ================================== \\

  int get researchLevel {
    int result = 0;

    for (final Research research in researches.values) {
      result += research.level;
    }

    return result;
  }

  bool get hasIntel {
    final int researchIntelPopulation =
        game.self.getResearch(ResearchType.intel_population).level;
    final int researchIntelMissiles =
        game.self.getResearch(ResearchType.intel_missiles).level;

    return (researchIntelPopulation > 0) || (researchIntelMissiles > 0);
  }

  Research getResearch(ResearchType researchType) =>
      researches[researchType] ??
      Research(
        player: this,
        level: 0,
        researchType: researchType,
      );

  void addResearches(List<Research> list) {
    for (final Research research in list) {
      researches[research.researchType] = research;
    }
  }

  // ============================ RESOURCES ================================= \\

  num get defconProductionBoost =>
      pow(1 + Constants.DEFCON_PRODUCTION_RATE, game.defconStep - 1);

  int get population => resources.get(ResourceType.population).floor();

  ResourceMap removePopulation(int amount) {
    if (population > amount) {
      resources.remove(ResourceType.population, amount);
    } else {
      resources.set(ResourceType.population, 0);
    }

    if (!isAlive) {
      final ResourceMap loot = {
        ResourceType.energy: resources.get(ResourceType.energy),
      };

      resources.clear();

      return loot;
    } else {
      return {};
    }
  }

  double productionOf(ResourceType resourceType) {
    double total = 0;

    for (final Building building in buildings.values) {
      if ((building is Producer) && (building.resourceType == resourceType)) {
        total += building.production;
      }
    }

    return total;
  }

  // ============================ MILITARY ================================== \\

  void createMilitary(MilitaryType militaryType) {
    switch (militaryType) {
      case MilitaryType.missile_defense:
        military.add(militaryType, 1);
        break;

      case MilitaryType.missile_attack:
        military.add(militaryType, 1);
        break;
    }
  }

  void removeDefenseMissiles(int value) =>
      military.remove(MilitaryType.missile_defense, value);

  void removeAttackMissiles(int value) =>
      military.remove(MilitaryType.missile_attack, value);

  int get defenseMissiles => military.get(MilitaryType.missile_defense).toInt();

  int get attackMissiles => military.get(MilitaryType.missile_attack).toInt();

  int get amountOfMissiles => defenseMissiles + attackMissiles;

  bool get hasAttackMissiles => attackMissiles > 0;

  int get attackMissileYield {
    final Research research = getResearch(ResearchType.missiles_nuclear_bomb);

    return Research.yield(research.level);
  }

  num get defenseMissilesEffectiveness {
    final Research research =
        getResearch(ResearchType.missiles_active_tracking);

    return research.increaseRate;
  }

  num get attackMissilesEffectiveness {
    final Research research = getResearch(ResearchType.missiles_signal_jamming);

    return research.decreaseRate;
  }

  num get missileAttackWarningWhenDefending {
    final Research research =
        getResearch(ResearchType.warning_missiles_radar_network);

    return research.increaseRate;
  }

  num get missileAttackWarningWhenAttacking {
    final Research research =
        getResearch(ResearchType.warning_missiles_hypersonic_propulsion);

    return research.decreaseRate;
  }

  // ============================= UPDATE =================================== \\

  void update(double dt) {
    if (isAlive) {
      buildings.values.forEach((e) => e.update(dt));
      researches.values.forEach((e) => e.update(dt));
      takeAction();
    }
  }

  void takeAction() {}
}
