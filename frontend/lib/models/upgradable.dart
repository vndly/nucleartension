import 'package:nucleartension/extensions/resource_map_extension.dart';
import 'package:nucleartension/models/players/self_player.dart';
import 'package:nucleartension/models/tasks/upgrade_task.dart';

abstract class Upgradable {
  final SelfPlayer player;
  int level;
  UpgradeTask? upgradeTask;

  Upgradable({
    required this.player,
    required this.level,
  });

  ResourceMap get upgradeCost;

  bool get isUpgrading => upgradeTask != null;

  bool get canUpgrade => !isUpgrading && hasResourcesToUpgrade;

  bool get hasResourcesToUpgrade => player.resources.hasItems(upgradeCost);

  void upgrade() {
    if (canUpgrade) {
      player.resources.removeItems(upgradeCost);
      upgradeTask = UpgradeTask(
        upgradable: this,
        cost: upgradeCost,
      );
    }
  }

  void update(double dt) {
    if ((upgradeTask != null) && upgradeTask!.update(dt)) {
      level++;
      upgradeTask = null;
    }
  }
}
