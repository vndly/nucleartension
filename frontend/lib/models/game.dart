import 'dart:math';
import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/models/buildings/military_facility.dart';
import 'package:nucleartension/models/buildings/producers/producer.dart';
import 'package:nucleartension/models/buildings/silo.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/types/unit_type.dart';

class Game {
  final ResourceInventory resourceInventory;
  final List<Building> buildings;
  num timeElapsed = 0;
  int defcon = 5;

  Game({
    required this.resourceInventory,
    required this.buildings,
  });

  int get defconStep => 6 - defcon;

  // ============================ BUILDINGS ================================= \\

  List<Producer> get producers =>
      buildings.where((b) => b.isProducer).map((b) => b as Producer).toList();

  MissileSilo get silo => buildingsByType(MissileSilo)[0] as MissileSilo;

  MilitaryFacility get militaryFacility =>
      buildingsByType(MilitaryFacility)[0] as MilitaryFacility;

  List<T> buildingsByType<T extends Building>(Type type) =>
      buildings.where((b) => b.runtimeType == type).map((e) => e as T).toList();

  double productionOf(ResourceType resourceType) {
    double total = 0;

    for (final Building building in buildings) {
      if ((building is Producer) && (building.resourceType == resourceType)) {
        total += building.production;
      }
    }

    return total;
  }

  void addBuildings(List<Building> list) {
    buildings.addAll(list);
  }

  void removeBuilding(Building building) {
    buildings.remove(building);
  }

  // =========================== PRODUCTION ================================= \\

  num get defconProductionBoost =>
      pow(Constants.DEFCON_PRODUCTION_RATE, defconStep - 1);

  // ============================== UNITS =================================== \\

  bool canBuildUnit(UnitType unitType) =>
      resourceInventory.hasItems(unitType.cost);

  void createUnit(UnitType unitType) {
    if (canBuildUnit(unitType)) {
      resourceInventory.removeItems(unitType.cost);
    }
  }

  // ============================= UPDATE =================================== \\

  void update(double dt) {
    timeElapsed += dt;

    for (final Building building in buildings) {
      building.update(dt);
    }
  }
}
