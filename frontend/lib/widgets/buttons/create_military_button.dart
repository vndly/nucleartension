import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/trainers/trainer.dart';
import 'package:nucleartension/types/military_type.dart';
import 'package:nucleartension/widgets/buttons/disabled_button.dart';
import 'package:nucleartension/widgets/buttons/enabled_button.dart';
import 'package:nucleartension/widgets/indicators/cost_indicator.dart';

class CreateMilitaryButton extends StatelessWidget {
  final Trainer trainer;
  final MilitaryType militaryType;

  const CreateMilitaryButton({
    required this.trainer,
    required this.militaryType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CostIndicator(
          player: trainer.player,
          cost: militaryType.effectiveCost(trainer.player),
        ),
        const HBox(10),
        CreateMilitaryButtonContent(
          trainer: trainer,
          militaryType: militaryType,
        ),
      ],
    );
  }
}

class CreateMilitaryButtonContent extends StatelessWidget {
  final Trainer trainer;
  final MilitaryType militaryType;

  const CreateMilitaryButtonContent({
    required this.trainer,
    required this.militaryType,
  });

  @override
  Widget build(BuildContext context) {
    if (trainer.canCreateMilitary(militaryType)) {
      return EnabledButton.create(
        size: 50,
        onTap: () => trainer.enqueueMilitary(militaryType),
      );
    } else if (!trainer.isQueueAvailable) {
      return DisabledButton.queueFull(size: 50);
    } else if (!trainer.hasResourcesToCreate(militaryType)) {
      return DisabledButton.noResources(size: 50);
    } else {
      return DisabledButton.disabled(size: 50);
    }
  }
}
