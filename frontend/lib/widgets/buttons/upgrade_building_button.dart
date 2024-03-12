import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/extensions/resource_map_extension.dart';
import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/buttons/symbol_button.dart';
import 'package:nucleartension/widgets/labels/resource_indicator.dart';

class UpgradeBuildingButton extends StatelessWidget {
  final Building building;

  const UpgradeBuildingButton(this.building);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SymbolButton.upgrade(
          size: 40,
          onTap: building.canUpgrade ? building.upgrade : null,
        ),
        const VBox(5),
        for (final ResourceMapEntry resource in building.upgradeCost.entries)
          ResourceIndicator(
            sprite: resource.key.sprite,
            value: Formatter.resource(resource.value),
            textColor: building.colony.resourceInventory.hasItem(resource)
                ? Palette.black
                : Palette.error,
            textSize: 14,
            iconSize: 14,
          ),
      ],
    );
  }
}
