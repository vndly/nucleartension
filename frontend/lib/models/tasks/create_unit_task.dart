import 'package:nucleartension/extensions/item_map_extension.dart';
import 'package:nucleartension/models/tasks/task.dart';
import 'package:nucleartension/types/unit_type.dart';

class CreateUnitTask extends Task {
  final UnitType unitType;

  CreateUnitTask({
    required this.unitType,
    required super.cost,
  }) : super(
          duration: cost.duration,
        );
}
