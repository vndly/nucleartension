import 'package:nucleartension/models/tasks/task.dart';
import 'package:nucleartension/models/upgradable.dart';

class UpgradeTask extends Task {
  final Upgradable upgradable;

  UpgradeTask({
    required this.upgradable,
    required super.cost,
    required super.duration,
  });
}
