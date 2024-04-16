import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';
import 'package:nucleartension/widgets/labels/labeled_text.dart';

class HeaderBlock extends StatelessWidget {
  final Player player;

  const HeaderBlock(this.player);

  @override
  Widget build(BuildContext context) {
    return CollapsedHeaderBlock(player);
  }
}

// -----------------------------------------------------------------------------

class CollapsedHeaderBlock extends StatelessWidget {
  final Player player;

  const CollapsedHeaderBlock(this.player);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CollapsedResourcesSection(player),
      ],
    );
  }
}

class CollapsedResourcesSection extends StatelessWidget {
  final Player player;

  const CollapsedResourcesSection(this.player);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CollapsedResourceLabel(
          player: player,
          resourceType: ResourceType.energy,
        ),
        CollapsedResourceLabel(
          player: player,
          resourceType: ResourceType.supplies,
        ),
        CollapsedResourceLabel(
          player: player,
          resourceType: ResourceType.technology,
        ),
        CollapsedResourceLabel(
          player: player,
          resourceType: ResourceType.population,
        ),
      ],
    );
  }
}

class CollapsedResourceLabel extends StatelessWidget {
  final Player player;
  final ResourceType resourceType;

  const CollapsedResourceLabel({
    required this.player,
    required this.resourceType,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            resourceType.icon(14),
            const HBox(10),
            Label(
              text: Formatter.resourceRaw(player.resources.get(resourceType)),
              color: Palette.textMain,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------

class ExpandedHeaderBlock extends StatelessWidget {
  final Player player;

  const ExpandedHeaderBlock(this.player);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          ExpandedResourcesSection(player),
          const Spacer(),
          ExpandedMilitarySection(player),
        ],
      ),
    );
  }
}

class ExpandedResourcesSection extends StatelessWidget {
  final Player player;

  const ExpandedResourcesSection(this.player);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpandedResourceLabel(
          player: player,
          resourceType: ResourceType.energy,
        ),
        const VBox(10),
        ExpandedResourceLabel(
          player: player,
          resourceType: ResourceType.supplies,
        ),
        const VBox(10),
        ExpandedResourceLabel(
          player: player,
          resourceType: ResourceType.technology,
        ),
        const VBox(10),
        ExpandedResourceLabel(
          player: player,
          resourceType: ResourceType.population,
        ),
      ],
    );
  }
}

class ExpandedMilitarySection extends StatelessWidget {
  final Player player;

  const ExpandedMilitarySection(this.player);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpandedMilitaryLabel(
          icon: Icons.warning_rounded,
          color: Palette.militaryDefcon,
          title: 'DEFCON:',
          value: player.game.defcon.toString(),
        ),
        const VBox(10),
        ExpandedMilitaryLabel(
          icon: Icons.star,
          color: Palette.militaryPower,
          title: 'MILITARY POWER:',
          value: Formatter.resourceRaw(player.militaryPower),
        ),
        const VBox(10),
        ExpandedMilitaryLabel(
          icon: Icons.shield,
          color: Palette.militaryDefenseMissile,
          title: 'DEFENSE MISSILES:',
          value: Formatter.resourceRaw(player.militaryDefenseMissiles),
        ),
        const VBox(10),
        ExpandedMilitaryLabel(
          icon: Icons.local_fire_department_rounded,
          color: Palette.militaryAttackMissile,
          title: 'ATTACK MISSILES:',
          value: Formatter.resourceRaw(player.militaryAttackMissiles),
        ),
      ],
    );
  }
}

class ExpandedResourceLabel extends StatelessWidget {
  final Player player;
  final ResourceType resourceType;

  const ExpandedResourceLabel({
    required this.player,
    required this.resourceType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        resourceType.icon(14),
        const HBox(10),
        LabeledText(
          label: '${resourceType.localized.toUpperCase()}:',
          text: Formatter.resource(player.resources.get(resourceType)),
          labelColor: Palette.textMain,
          textColor: Palette.textMain,
          size: 14,
        ),
      ],
    );
  }
}

class ExpandedMilitaryLabel extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String value;

  const ExpandedMilitaryLabel({
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
          labelColor: Palette.textMain,
          textColor: Palette.textMain,
          size: 14,
        ),
      ],
    );
  }
}
