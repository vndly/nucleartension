import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/building.dart';
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
        SymbolButton.upgrade(
          size: 70,
          onTap: building.canUpgrade ? building.upgrade : null,
        ),
      ],
    );
  }
}
