import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/types/unit_type.dart';

abstract class Trainer extends Building {
  Trainer({
    required super.buildingType,
    required super.player,
    required super.level,
  });

  bool canCreateUnit(UnitType unitType) =>
      player.resourceInventory.hasItems(unitType.cost);

  void createUnit(UnitType unitType) {
    if (canCreateUnit(unitType)) {
      player.resourceInventory.removeItems(unitType.cost);
      player.createUnit(unitType);
    }
  }

  /*@override
  void update(double dt) {
    super.update(dt);
  }*/
}
