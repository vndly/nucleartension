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
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/military_type.dart';
import 'package:nucleartension/types/research_type.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/types/unit_type.dart';

class SelfPlayer extends Player {
  const SelfPlayer({
    required super.game,
    required super.name,
    required super.color,
    required super.resources,
    required super.buildings,
    required super.researches,
    required super.military,
  });

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

  // ============================ RESEARCHES ================================ \\

  Research getResearch(ResearchType researchType) => researches[researchType]!;

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
      pow(Constants.DEFCON_PRODUCTION_RATE, game.defconStep - 1);

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

  // ============================= UPDATE =================================== \\

  @override
  void update(double dt) {
    for (final Building building in buildings.values) {
      building.update(dt);
    }

    for (final Research research in researches.values) {
      research.update(dt);
    }
  }
}
