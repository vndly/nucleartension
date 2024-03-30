import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/trainers/trainer.dart';
import 'package:nucleartension/types/unit_type.dart';
import 'package:nucleartension/widgets/buttons/symbol_button.dart';
import 'package:nucleartension/widgets/indicators/cost_indicator.dart';

class CreateUnitButton extends StatelessWidget {
  final Trainer trainer;
  final UnitType unitType;

  const CreateUnitButton({
    required this.trainer,
    required this.unitType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CostIndicator(
          player: trainer.player,
          cost: unitType.cost,
        ),
        const HBox(10),
        SymbolButton.create(
          size: 50,
          onTap: trainer.canCreateUnit(unitType)
              ? () => trainer.enqueueUnit(unitType)
              : null,
        ),
      ],
    );
  }
}
