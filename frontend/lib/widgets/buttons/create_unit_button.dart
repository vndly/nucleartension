import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/types/missile_type.dart';
import 'package:nucleartension/widgets/buttons/symbol_button.dart';
import 'package:nucleartension/widgets/indicators/cost_indicator.dart';

class CreateUnitButton extends StatelessWidget {
  final Game game;
  final MissileType unitType;

  const CreateUnitButton({
    required this.game,
    required this.unitType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CostIndicator(
          game: game,
          cost: unitType.cost,
        ),
        const HBox(10),
        SymbolButton.create(
          size: 50,
          onTap: game.canBuildUnit(unitType)
              ? () => game.createUnit(unitType)
              : null,
        ),
      ],
    );
  }
}
