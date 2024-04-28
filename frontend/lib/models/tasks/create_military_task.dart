import 'package:nucleartension/models/tasks/task.dart';
import 'package:nucleartension/types/military_type.dart';

class CreateMilitaryTask extends Task {
  final MilitaryType militaryType;

  CreateMilitaryTask({
    required this.militaryType,
    required super.cost,
    required super.duration,
  });
}
