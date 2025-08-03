import 'package:nucleartension/domain/models/tasks/task.dart';
import 'package:nucleartension/domain/types/missile_type.dart';

class CreateMissileTask extends Task {
  final MissileType missileType;

  CreateMissileTask({
    required this.missileType,
    required super.cost,
    required super.duration,
  });
}
