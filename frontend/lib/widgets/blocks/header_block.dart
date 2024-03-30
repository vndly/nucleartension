import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/states/game_state.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/labeled_text.dart';

class HeaderBlock extends StatelessWidget {
  final GameState state;

  const HeaderBlock(this.state);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          ResourcesSection(state.game),
          const Spacer(),
          MilitarySection(state.game),
        ],
      ),
    );
  }
}

class ResourcesSection extends StatelessWidget {
  final Game game;

  const ResourcesSection(this.game);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResourceLabel(
          game: game,
          resourceType: ResourceType.energy,
        ),
        const VBox(10),
        ResourceLabel(
          game: game,
          resourceType: ResourceType.supplies,
        ),
        const VBox(10),
        ResourceLabel(
          game: game,
          resourceType: ResourceType.population,
        ),
        const VBox(10),
        ResourceLabel(
          game: game,
          resourceType: ResourceType.technology,
        ),
      ],
    );
  }
}

class MilitarySection extends StatelessWidget {
  final Game game;

  const MilitarySection(this.game);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MilitaryLabel(
          icon: Icons.warning_rounded,
          color: Palette.militaryDefcon,
          title: 'DEFCON:',
          value: '5',
        ),
        VBox(10),
        MilitaryLabel(
          icon: Icons.star,
          color: Palette.militaryPower,
          title: 'MILITARY POWER:',
          value: '15',
        ),
        VBox(10),
        MilitaryLabel(
          icon: Icons.local_fire_department_rounded,
          color: Palette.militaryAttackMissile,
          title: 'ATTACK MISSILES:',
          value: '5',
        ),
        VBox(10),
        MilitaryLabel(
          icon: Icons.shield,
          color: Palette.militaryDefenseMissile,
          title: 'DEFENSE MISSILES:',
          value: '5',
        ),
      ],
    );
  }
}

class ResourceLabel extends StatelessWidget {
  final Game game;
  final ResourceType resourceType;

  const ResourceLabel({
    required this.game,
    required this.resourceType,
  });

  @override
  Widget build(BuildContext context) {
    final num amount = game.resourceInventory.get(resourceType);
    final String production =
        '${Formatter.production(game.productionOf(resourceType))}/s';

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        resourceType.icon(14),
        const HBox(10),
        LabeledText(
          label: '${resourceType.name.toUpperCase()}:',
          text: '${Formatter.resource(amount)} ($production)',
          labelColor: Palette.textLight,
          textColor: Palette.textLight,
        ),
      ],
    );
  }
}

class MilitaryLabel extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String value;

  const MilitaryLabel({
    required this.icon,
    required this.color,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: color,
          size: 14,
        ),
        const HBox(10),
        LabeledText(
          label: title,
          text: value,
          labelColor: Palette.textLight,
          textColor: Palette.textLight,
        ),
      ],
    );
  }
}
