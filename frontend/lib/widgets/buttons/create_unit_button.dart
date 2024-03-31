import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/trainers/trainer.dart';
import 'package:nucleartension/types/unit_type.dart';
import 'package:nucleartension/widgets/buttons/disabled_button.dart';
import 'package:nucleartension/widgets/buttons/enabled_button.dart';
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
        CreateUnitButtonContent(
          trainer: trainer,
          unitType: unitType,
        ),
      ],
    );
  }
}

class CreateUnitButtonContent extends StatelessWidget {
  final Trainer trainer;
  final UnitType unitType;

  const CreateUnitButtonContent({
    required this.trainer,
    required this.unitType,
  });

  @override
  Widget build(BuildContext context) {
    if (trainer.canCreateUnit(unitType)) {
      return EnabledButton.create(
        size: 50,
        onTap: () => trainer.enqueueUnit(unitType),
      );
    } else if (!trainer.hasResourcesToCreate(unitType)) {
      return DisabledButton.noResources(size: 50);
    } else if (!trainer.isQueueAvailable) {
      return DisabledButton.queueFull(size: 50);
    } else {
      return DisabledButton.disabled(size: 50);
    }
  }
}
