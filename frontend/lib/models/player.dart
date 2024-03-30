import 'dart:math';
import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/models/buildings/military_facility.dart';
import 'package:nucleartension/models/buildings/producers/power_plant.dart';
import 'package:nucleartension/models/buildings/producers/producer.dart';
import 'package:nucleartension/models/buildings/producers/propaganda_station.dart';
import 'package:nucleartension/models/buildings/producers/supply_center.dart';
import 'package:nucleartension/models/buildings/producers/tech_lab.dart';
import 'package:nucleartension/models/buildings/silo.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/types/unit_type.dart';

class Player {
  final Game game;
  final ResourceInventory resourceInventory;
  final List<Building> buildings;

  Player({
    required this.game,
    required this.resourceInventory,
    required this.buildings,
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

  bool canCreateUnit(UnitType unitType) =>
      resourceInventory.hasItems(unitType.cost);

  void createUnit(UnitType unitType) {
    if (canCreateUnit(unitType)) {
      resourceInventory.removeItems(unitType.cost);
    }
  }

  // ============================= UPDATE =================================== \\

  void update(double dt) {
    for (final Building building in buildings) {
      building.update(dt);
    }
  }
}
