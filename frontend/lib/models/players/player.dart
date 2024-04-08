import 'dart:math';
import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/models/buildings/producers/power_plant.dart';
import 'package:nucleartension/models/buildings/producers/producer.dart';
import 'package:nucleartension/models/buildings/producers/propaganda_station.dart';
import 'package:nucleartension/models/buildings/producers/supply_center.dart';
import 'package:nucleartension/models/buildings/producers/tech_lab.dart';
import 'package:nucleartension/models/buildings/trainers/military_facility.dart';
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
import 'package:nucleartension/types/unit_type.dart';

class Player {
  final Game game;
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

  // ============================ BUILDINGS ================================= \\

  PowerPlant get powerPlant =>
      buildings[BuildingType.power_plant] as PowerPlant;

  SupplyCenter get supplyCenter =>
      buildings[BuildingType.supply_center] as SupplyCenter;

  PropagandaStation get propagandaStation =>
      buildings[BuildingType.propaganda_station] as PropagandaStation;

  TechLab get techLab => buildings[BuildingType.tech_lab] as TechLab;

  MissileSilo get missileSilo =>
      buildings[BuildingType.missile_silo] as MissileSilo;

  MilitaryFacility get militaryFacility =>
      buildings[BuildingType.military_facility] as MilitaryFacility;

  // ============================ RESEARCH ================================== \\

  Research getResearch(ResearchType researchType) =>
      researches[researchType] ??
      Research(
        player: this,
        level: 0,
        researchType: researchType,
      );

  bool hasIntelEconomy(int level) {
    final Research research = getResearch(ResearchType.intel_economy);

    return research.level >= level;
  }

  bool hasIntelMilitary(int level) {
    final Research research = getResearch(ResearchType.intel_military);

    return research.level >= level;
  }

  bool hasIntelTechnology(int level) {
    final Research research = getResearch(ResearchType.intel_technology);

    return research.level >= level;
  }

  // =========================== PRODUCTION ================================= \\

  double productionOf(ResourceType resourceType) {
    double total = 0;

    for (final Building building in buildings.values) {
      if ((building is Producer) && (building.resourceType == resourceType)) {
        total += building.production;
      }
    }

    return total;
  }

  num get defconProductionBoost =>
      pow(1 + Constants.DEFCON_PRODUCTION_RATE, game.defconStep - 1);

  // ============================== UNITS =================================== \\

  void createUnit(UnitType unitType) {
    switch (unitType) {
      case UnitType.defense:
        military.add(MilitaryType.defense_missiles, 1);
        break;

      case UnitType.attack:
        military.add(MilitaryType.attack_missiles, 1);
        game.onAttackMissileCreated();
        break;

      case UnitType.infantry:
      case UnitType.vehicle:
      case UnitType.aircraft:
        military.add(MilitaryType.power, unitType.power);
        game.onMilitaryCreated();
        break;
    }
  }

  // ============================ MILITARY ================================== \\

  int get militaryPower => military.get(MilitaryType.power).toInt();

  int get militaryDefenseMissiles =>
      military.get(MilitaryType.defense_missiles).toInt();

  int get militaryAttackMissiles =>
      military.get(MilitaryType.attack_missiles).toInt();

  bool get hasMilitaryPower => militaryPower > 0;

  bool get hasAttackMissiles => militaryAttackMissiles > 0;

  num get attackMissileYield {
    final Research research = getResearch(ResearchType.weapons_nuclear_bomb);

    return Research.yield(research.level);
  }

  num get defenseMissilesEffectiveness {
    final Research research =
        getResearch(ResearchType.missiles_enhanced_guidance_systems);

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

  num get unitAttackWarningWhenDefending {
    final Research research =
        getResearch(ResearchType.warning_military_early_warning);

    return research.increaseRate;
  }

  num get unitAttackWarningWhenAttacking {
    final Research research =
        getResearch(ResearchType.warning_military_fast_deployments);

    return research.decreaseRate;
  }

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

  void update(double dt) {
    for (final Building building in buildings.values) {
      building.update(dt);
    }

    for (final Research research in researches.values) {
      research.update(dt);
    }
  }
}
