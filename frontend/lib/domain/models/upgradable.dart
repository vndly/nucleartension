import 'package:nucleartension/domain/models/players/player.dart';
import 'package:nucleartension/domain/models/tasks/upgrade_task.dart';

abstract class Upgradable {
  final Player player;
  int level;
  UpgradeTask? upgradeTask;

  Upgradable({required this.player, required this.level});

  int get upgradeCost;

  num get upgradeTime;

  bool get isMax;

  bool get isUpgrading => upgradeTask != null;

  bool get hasResourcesToUpgrade =>
      true; // player.resources.hasItems(upgradeCost);

  bool upgrade() {
    if (hasResourcesToUpgrade) {
      //player.resources.removeItems(upgradeCost);
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
    if (upgradeTask != null) {
      if (upgradeTask!.update(dt)) {
        level++;
        upgradeTask = null;
      } else if (upgradeTask!.canceled) {
        //player.resources.addItems(upgradeTask!.cost);
        upgradeTask = null;
      }
    }
  }
}
