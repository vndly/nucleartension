import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/buttons/symbol_button.dart';
import 'package:nucleartension/widgets/indicators/cost_indicator.dart';

class UpgradeBuildingButton extends StatelessWidget {
  final Building building;

  const UpgradeBuildingButton(this.building);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CostIndicator(
          game: building.game,
          cost: building.upgradeCost,
        ),
        const HBox(10),
        if (building.isUpgrading)
          UpgradeBuildingButtonProgress(building)
        else
          SymbolButton.upgrade(
            size: 70,
            onTap: building.canUpgrade ? building.upgrade : null,
          ),
      ],
    );
  }
}

class UpgradeBuildingButtonProgress extends StatelessWidget {
  final Building building;

  const UpgradeBuildingButtonProgress(this.building);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Stack(
        children: [
          Container(
            width: 70,
            height: 70,
            color: Palette.success,
            child: const Center(
              child: Icon(
                Icons.arrow_upward,
                color: Palette.icon,
                size: 70 * 2 / 3,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 70,
              height: 70 - (70 * building.upgradeProgress),
              color: Palette.buttonProgress,
            ),
          )
        ],
      ),
    );
  }
}
