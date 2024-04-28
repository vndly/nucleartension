import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/upgradable.dart';
import 'package:nucleartension/widgets/buttons/disabled_button.dart';
import 'package:nucleartension/widgets/buttons/enabled_button.dart';
import 'package:nucleartension/widgets/indicators/cost_indicator.dart';
import 'package:nucleartension/widgets/indicators/task_progress_indicator.dart';

class UpgradeButton extends StatelessWidget {
  final Upgradable upgradable;
  final double size;

  const UpgradeButton({
    required this.upgradable,
    required this.size,
  });

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
            size: size,
            task: upgradable.upgradeTask!,
            cancellable: true,
          )
        else
          UpgradeOrBuildButton(
            upgradable: upgradable,
            size: size,
          ),
      ],
    );
  }
}

class UpgradeOrBuildButton extends StatelessWidget {
  final Upgradable upgradable;
  final double size;

  const UpgradeOrBuildButton({
    required this.upgradable,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    if (upgradable.canUpgrade) {
      if (upgradable.level == 0) {
        return EnabledButton.build(
          size: size,
          onTap: upgradable.upgrade,
        );
      } else {
        return EnabledButton.upgrade(
          size: size,
          onTap: upgradable.upgrade,
        );
      }
    } else if (!upgradable.hasResourcesToUpgrade) {
      return DisabledButton.noResources(size: size);
    } else {
      return DisabledButton.disabled(size: size);
    }
  }
}
