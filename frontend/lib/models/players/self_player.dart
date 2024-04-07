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

  PowerPlant get powerPlant => getBuilding(PowerPlant);

  SupplyCenter get supplyCenter => getBuilding(SupplyCenter);

  PropagandaStation get propagandaStation => getBuilding(PropagandaStation);

  TechLab get techLab => getBuilding(TechLab);

  MissileSilo get missileSilo => getBuilding(MissileSilo);

  MilitaryFacility get militaryFacility => getBuilding(MilitaryFacility);

  T getBuilding<T extends Building>(Type type) =>
      buildings.where((b) => b.runtimeType == type).first as T;

  // ============================ RESEARCHES ================================ \\

  Research getResearch(ResearchType researchType) =>
      researches.where((b) => b.researchType == researchType).first;

  // =========================== PRODUCTION ================================= \\

  double productionOf(ResourceType resourceType) {
    double total = 0;

    for (final Building building in buildings) {
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
        military.defenseMissiles++;
        break;

      case UnitType.attack:
        military.attackMissiles++;
        game.onAttackMissileCreated();
        break;

      case UnitType.infantry:
      case UnitType.vehicle:
      case UnitType.aircraft:
        military.power += unitType.power;
        game.onMilitaryCreated();
        break;
    }
  }

  // ============================= UPDATE =================================== \\

  @override
  void update(double dt) {
    for (final Building building in buildings) {
      building.update(dt);
    }

    for (final Research research in researches) {
      research.update(dt);
    }
  }
}
