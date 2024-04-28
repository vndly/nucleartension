import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/tasks/create_military_task.dart';
import 'package:nucleartension/models/tasks/task.dart';
import 'package:nucleartension/types/military_type.dart';

class Trainer extends Building {
  final Map<MilitaryType, List<CreateMilitaryTask>> queues;

  Trainer({
    required super.buildingType,
    required super.player,
    required super.level,
    required this.queues,
  });

  int get queueSize =>
      queues.values.map((e) => e.length).reduce((a, b) => a + b);

  int get queueMaxCapacity => level * Constants.QUEUE_CAPACITY_PER_LEVEL;

  int enqueuedMilitary(MilitaryType militaryType) =>
      queues[militaryType]?.length ?? 0;

  Task firstTask(MilitaryType militaryType) => queues[militaryType]!.first;

  bool get isQueueAvailable => queueSize < queueMaxCapacity;

  bool hasResourcesToCreate(MilitaryType militaryType) =>
      player.resources.hasItems(militaryType.effectiveCost(player));

  bool canCreateMilitary(MilitaryType militaryType) =>
      (level > 0) && isQueueAvailable && hasResourcesToCreate(militaryType);

  bool enqueueMilitary(MilitaryType militaryType) {
    if (canCreateMilitary(militaryType)) {
      final ResourceMap cost = militaryType.effectiveCost(player);
      final num duration = militaryType.effectiveDuration(player);
      player.resources.removeItems(cost);

      queues[militaryType]?.add(CreateMilitaryTask(
        militaryType: militaryType,
        cost: cost,
        duration: duration,
      ));

      return true;
    } else {
      return false;
    }
  }

  @override
  void update(double dt) {
    for (final List<CreateMilitaryTask> queue in queues.values) {
      _processQueue(
        dt: dt,
        queue: queue,
      );
    }

    super.update(dt);
  }

  void _processQueue({
    required double dt,
    required List<CreateMilitaryTask> queue,
  }) {
    if (queue.isNotEmpty) {
      final CreateMilitaryTask task = queue.first;

      if (task.update(dt)) {
        player.createMilitary(task.militaryType);
        queue.remove(task);
      }
    }
  }
}
