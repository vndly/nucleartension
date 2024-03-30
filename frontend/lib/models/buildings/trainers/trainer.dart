import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/types/unit_type.dart';

abstract class Trainer extends Building {
  Trainer({
    required super.buildingType,
    required super.player,
    required super.level,
  });

  int get queueSize;

  int get queueMaxCapacity => level * 2;

  bool canCreateUnit(UnitType unitType) =>
      (queueSize < queueMaxCapacity) &&
      player.resourceInventory.hasItems(unitType.cost);

  void enqueueUnit(UnitType unitType) {
    if (canCreateUnit(unitType)) {
      player.resourceInventory.removeItems(unitType.cost);
      addUnitToQueue(unitType);
    }
  }

  void addUnitToQueue(UnitType unitType);
}
