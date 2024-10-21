import 'package:nucleartension/models/tasks/task.dart';
import 'package:nucleartension/types/missile_type.dart';

class CreateMissileTask extends Task {
  final MissileType missileType;

  CreateMissileTask({
    required this.missileType,
    required super.cost,
    required super.duration,
  });
}
