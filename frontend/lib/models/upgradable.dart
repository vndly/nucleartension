import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/tasks/upgrade_task.dart';

abstract class Upgradable {
  final Player player;
  int level;
  UpgradeTask? upgradeTask;

  Upgradable({
    required this.player,
    required this.level,
  });

  ResourceMap get upgradeCost;

  num get upgradeTime;

  bool get isUpgrading => upgradeTask != null;

  bool get canUpgrade => !isUpgrading && hasResourcesToUpgrade;

  bool get hasResourcesToUpgrade => player.resources.hasItems(upgradeCost);

  bool upgrade() {
    if (canUpgrade) {
      player.resources.removeItems(upgradeCost);
      upgradeTask = UpgradeTask(
        upgradable: this,
        cost: upgradeCost,
        duration: upgradeTime,
      );

      return true;
    } else {
      return false;
    }
  }

  void update(double dt) {
    if ((upgradeTask != null) && upgradeTask!.update(dt)) {
      level++;
      upgradeTask = null;
    }
  }
}
