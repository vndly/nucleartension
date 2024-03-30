import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/models/tasks/create_unit_task.dart';
import 'package:nucleartension/types/unit_type.dart';

class Trainer extends Building {
  final Map<UnitType, List<CreateUnitTask>> queues;

  Trainer({
    required super.buildingType,
    required super.player,
    required super.level,
    required this.queues,
  });

  int get queueSize =>
      queues.values.map((e) => e.length).reduce((a, b) => a + b);

  int get queueMaxCapacity => level * 2;

  bool canCreateUnit(UnitType unitType) =>
      (queueSize < queueMaxCapacity) &&
      player.resourceInventory.hasItems(unitType.cost);

  void enqueueUnit(UnitType unitType) {
    if (canCreateUnit(unitType)) {
      player.resourceInventory.removeItems(unitType.cost);

      queues[unitType]?.add(CreateUnitTask(
        unitType: unitType,
        cost: unitType.cost,
      ));
    }
  }

  @override
  void update(double dt) {
    for (final List<CreateUnitTask> queue in queues.values) {
      _processQueue(
        dt: dt,
        queue: queue,
      );
    }

    super.update(dt);
  }

  void _processQueue({
    required double dt,
    required List<CreateUnitTask> queue,
  }) {
    if (queue.isNotEmpty) {
      final CreateUnitTask task = queue.first;

      if (task.update(dt)) {
        player.createUnit(task.unitType);
        queue.remove(task);
      }
    }
  }
}
