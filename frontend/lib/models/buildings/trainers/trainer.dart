import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/models/tasks/create_unit_task.dart';
import 'package:nucleartension/models/tasks/task.dart';
import 'package:nucleartension/types/unit_type.dart';

abstract class Trainer extends Building {
  final List<CreateUnitTask> createUnitTasks;

  Trainer({
    required super.buildingType,
    required super.player,
    required super.level,
    required this.createUnitTasks,
  });

  bool canCreateUnit(UnitType unitType) =>
      player.resourceInventory.hasItems(unitType.cost);

  void enqueueUnit(UnitType unitType) {
    if (canCreateUnit(unitType)) {
      player.resourceInventory.removeItems(unitType.cost);
      createUnitTasks.add(CreateUnitTask(
        unitType: unitType,
        cost: unitType.cost,
      ));
    }
  }

  @override
  void update(double dt) {
    Task.updater(
      dt: dt,
      tasks: createUnitTasks,
      callback: (task) {
        player.createUnit(task.unitType);
      },
    );

    super.update(dt);
  }
}
