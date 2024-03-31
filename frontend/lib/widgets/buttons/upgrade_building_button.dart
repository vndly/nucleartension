import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/widgets/buttons/symbol_button.dart';
import 'package:nucleartension/widgets/indicators/cost_indicator.dart';
import 'package:nucleartension/widgets/indicators/task_progress_indicator.dart';

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
          TaskProgressIndicator(
            size: 70,
            task: building.upgradeTask!,
          )
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
    if (building.canUpgrade) {
      if (building.level == 0) {
        return SymbolButton.build(
          size: 70,
          onTap: building.upgrade,
        );
      } else {
        return SymbolButton.upgrade(
          size: 70,
          onTap: building.upgrade,
        );
      }
    } else if (!building.hasResourcesToUpgrade) {
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
    } else {
      if (building.level == 0) {
        return SymbolButton.build(
          size: 70,
          onTap: null,
        );
      } else {
        return SymbolButton.upgrade(
          size: 70,
          onTap: null,
        );
      }
    }
  }
}
