import 'package:nucleartension/domain/models/tasks/task.dart';
import 'package:nucleartension/domain/models/upgradable.dart';

class UpgradeTask extends Task {
  final Upgradable upgradable;

  UpgradeTask({
    required this.upgradable,
    required super.cost,
    required super.duration,
  });
}
