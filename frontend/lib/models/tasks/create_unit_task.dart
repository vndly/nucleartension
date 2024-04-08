import 'package:nucleartension/models/tasks/task.dart';
import 'package:nucleartension/types/unit_type.dart';

class CreateUnitTask extends Task {
  final UnitType unitType;

  CreateUnitTask({
    required this.unitType,
    required super.cost,
    required super.duration,
  });
}
