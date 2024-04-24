import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/tasks/create_unit_task.dart';
import 'package:nucleartension/models/tasks/task.dart';
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

  int get queueMaxCapacity => level * Constants.QUEUE_CAPACITY_PER_LEVEL;

  int enqueuedUnits(UnitType unitType) => queues[unitType]?.length ?? 0;

  Task firstTask(UnitType unitType) => queues[unitType]!.first;

  bool get isQueueAvailable => queueSize < queueMaxCapacity;

  bool hasResourcesToCreate(UnitType unitType) =>
      player.resources.hasItems(unitType.effectiveCost(player));

  bool canCreateUnit(UnitType unitType) =>
      (level > 0) && isQueueAvailable && hasResourcesToCreate(unitType);

  void enqueueUnit(UnitType unitType) {
    if (canCreateUnit(unitType)) {
      final ResourceMap cost = unitType.effectiveCost(player);
      final num duration = unitType.effectiveDuration(player);
      player.resources.removeItems(cost);

      queues[unitType]?.add(CreateUnitTask(
        unitType: unitType,
        cost: cost,
        duration: duration,
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
