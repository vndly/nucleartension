import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/players/self_player.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/labeled_text.dart';

class HeaderBlock extends StatelessWidget {
  final SelfPlayer player;

  const HeaderBlock(this.player);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          ResourcesSection(player),
          const Spacer(),
          MilitarySection(player),
        ],
      ),
    );
  }
}

class ResourcesSection extends StatelessWidget {
  final SelfPlayer player;

  const ResourcesSection(this.player);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResourceLabel(
          player: player,
          resourceType: ResourceType.energy,
        ),
        const VBox(10),
        ResourceLabel(
          player: player,
          resourceType: ResourceType.supplies,
        ),
        const VBox(10),
        ResourceLabel(
          player: player,
          resourceType: ResourceType.technology,
        ),
        const VBox(10),
        ResourceLabel(
          player: player,
          resourceType: ResourceType.population,
        ),
      ],
    );
  }
}

class MilitarySection extends StatelessWidget {
  final SelfPlayer player;

  const MilitarySection(this.player);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MilitaryLabel(
          icon: Icons.warning_rounded,
          color: Palette.militaryDefcon,
          title: 'DEFCON:',
          value: player.game.defcon.toString(),
        ),
        const VBox(10),
        MilitaryLabel(
          icon: Icons.star,
          color: Palette.militaryPower,
          title: 'MILITARY POWER:',
          value: player.military.power.toString(),
        ),
        const VBox(10),
        MilitaryLabel(
          icon: Icons.shield,
          color: Palette.militaryDefenseMissile,
          title: 'DEFENSE MISSILES:',
          value: player.military.defenseMissiles.toString(),
        ),
        const VBox(10),
        MilitaryLabel(
          icon: Icons.local_fire_department_rounded,
          color: Palette.militaryAttackMissile,
          title: 'ATTACK MISSILES:',
          value: player.military.attackMissiles.toString(),
        ),
      ],
    );
  }
}

class ResourceLabel extends StatelessWidget {
  final SelfPlayer player;
  final ResourceType resourceType;

  const ResourceLabel({
    required this.player,
    required this.resourceType,
  });

  @override
  Widget build(BuildContext context) {
    final num amount = player.resources.get(resourceType);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        resourceType.icon(14),
        const HBox(10),
        LabeledText(
          label: '${resourceType.localized.toUpperCase()}:',
          text: Formatter.resource(amount),
          labelColor: Palette.textLight,
          textColor: Palette.textLight,
          size: 14,
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
          size: 14,
        ),
      ],
    );
  }
}
