import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/extensions/duration_extension.dart';
import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/buttons/symbol_button.dart';
import 'package:nucleartension/widgets/indicators/cost_indicator.dart';
import 'package:nucleartension/widgets/labels/label.dart';
import 'package:nucleartension/widgets/overlays/progress_overlay.dart';

class UpgradeBuildingButton extends StatelessWidget {
  final Building building;

  const UpgradeBuildingButton(this.building);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CostIndicator(
          player: building.player,
          cost: building.upgradeCost,
        ),
        const HBox(10),
        if (building.isUpgrading)
          UpgradeBuildingButtonProgress(building)
        else
          UpgradeOrBuildButton(building),
      ],
    );
  }
}

class UpgradeOrBuildButton extends StatelessWidget {
  final Building building;

  const UpgradeOrBuildButton(this.building);

  @override
  Widget build(BuildContext context) {
    if (building.level == 0) {
      return SymbolButton.build(
        size: 70,
        onTap: building.canUpgrade ? building.upgrade : null,
      );
    } else {
      return SymbolButton.upgrade(
        size: 70,
        onTap: building.canUpgrade ? building.upgrade : null,
      );
    }
  }
}

class UpgradeBuildingButtonProgress extends StatelessWidget {
  final Building building;

  const UpgradeBuildingButtonProgress(this.building);

  @override
  Widget build(BuildContext context) {
    return ProgressOverlay(
      size: 70,
      progress: building.upgradeProgress,
      child: Container(
        color: Palette.buttonDisabled,
        child: Center(
          child: Label(
            text: building.upgradeTimeLeft.formatted,
            size: building.upgradeTimeLeft.hasHours ? 12 : 16,
            weight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
