import 'package:nucleartension/models/buildings/trainers/trainer.dart';
import 'package:nucleartension/models/tasks/create_unit_task.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/unit_type.dart';

class MissileSilo extends Trainer {
  final List<CreateUnitTask> missileDefenseQueue;
  final List<CreateUnitTask> missileAttackQueue;

  MissileSilo({
    required super.player,
    required super.level,
    required this.missileDefenseQueue,
    required this.missileAttackQueue,
  }) : super(buildingType: BuildingType.missile_silo);

  @override
  int get queueSize => missileDefenseQueue.length + missileAttackQueue.length;

  @override
  void addUnitToQueue(UnitType unitType) {
    if (unitType == UnitType.defense) {
      missileDefenseQueue.add(CreateUnitTask(
        unitType: unitType,
        cost: unitType.cost,
      ));
    } else if (unitType == UnitType.attack) {
      missileAttackQueue.add(CreateUnitTask(
        unitType: unitType,
        cost: unitType.cost,
      ));
    } else {
      throw Exception('Invalid unit type: $unitType');
    }
  }

  @override
  void update(double dt) {
    _processQueue(
      dt: dt,
      queue: missileDefenseQueue,
    );
    _processQueue(
      dt: dt,
      queue: missileAttackQueue,
    );

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
