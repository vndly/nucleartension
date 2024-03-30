import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/player.dart';
import 'package:nucleartension/types/unit_type.dart';
import 'package:nucleartension/widgets/buttons/symbol_button.dart';
import 'package:nucleartension/widgets/indicators/cost_indicator.dart';

class CreateUnitButton extends StatelessWidget {
  final Player player;
  final UnitType unitType;

  const CreateUnitButton({
    required this.player,
    required this.unitType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CostIndicator(
          player: player,
          cost: unitType.cost,
        ),
        const HBox(10),
        SymbolButton.create(
          size: 50,
          onTap: player.canBuildUnit(unitType)
              ? () => player.createUnit(unitType)
              : null,
        ),
      ],
    );
  }
}
