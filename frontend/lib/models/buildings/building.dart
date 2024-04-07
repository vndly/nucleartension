import 'package:nucleartension/models/buildings/producers/power_plant.dart';
import 'package:nucleartension/models/buildings/producers/propaganda_station.dart';
import 'package:nucleartension/models/buildings/producers/supply_center.dart';
import 'package:nucleartension/models/buildings/producers/tech_lab.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/players/self_player.dart';
import 'package:nucleartension/models/upgradable.dart';
import 'package:nucleartension/types/building_type.dart';

class Building extends Upgradable {
  final BuildingType buildingType;

  Building({
    required super.player,
    required super.level,
    required this.buildingType,
  });

  @override
  ResourceMap get upgradeCost => buildingType.cost(level + 1);

  factory Building.create({
    required SelfPlayer player,
    required BuildingType buildingType,
    required int level,
  }) {
    switch (buildingType) {
      case BuildingType.power_plant:
        return PowerPlant(
          player: player,
          level: level,
        );
      case BuildingType.supply_center:
        return SupplyCenter(
          player: player,
          level: level,
        );
      case BuildingType.propaganda_station:
        return PropagandaStation(
          player: player,
          level: level,
        );
      case BuildingType.tech_lab:
        return TechLab(
          player: player,
          level: level,
        );
      case BuildingType.missile_silo:
      case BuildingType.military_facility:
        throw Exception();
    }
  }
}
