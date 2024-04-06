import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/upgradable.dart';
import 'package:nucleartension/widgets/buttons/disabled_button.dart';
import 'package:nucleartension/widgets/buttons/enabled_button.dart';
import 'package:nucleartension/widgets/indicators/cost_indicator.dart';
import 'package:nucleartension/widgets/indicators/task_progress_indicator.dart';

class UpgradeButton extends StatelessWidget {
  final Upgradable upgradable;

  const UpgradeButton(this.upgradable);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CostIndicator(
          player: upgradable.player,
          cost: upgradable.upgradeCost,
        ),
        const HBox(10),
        if (upgradable.isUpgrading)
          TaskProgressIndicator(
            size: 70,
            task: upgradable.upgradeTask!,
          )
        else
          UpgradeOrBuildButton(upgradable),
      ],
    );
  }
}

class UpgradeOrBuildButton extends StatelessWidget {
  final Upgradable upgradable;

  const UpgradeOrBuildButton(this.upgradable);

  @override
  Widget build(BuildContext context) {
    if (upgradable.canUpgrade) {
      if (upgradable.level == 0) {
        return EnabledButton.build(
          size: 70,
          onTap: upgradable.upgrade,
        );
      } else {
        return EnabledButton.upgrade(
          size: 70,
          onTap: upgradable.upgrade,
        );
      }
    } else if (!upgradable.hasResourcesToUpgrade) {
      return DisabledButton.noResources(size: 70);
    } else {
      return DisabledButton.disabled(size: 70);
    }
  }
}
