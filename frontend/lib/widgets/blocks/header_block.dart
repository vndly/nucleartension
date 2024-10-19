import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';
import 'package:nucleartension/widgets/labels/labeled_text.dart';

class HeaderBlock extends StatelessWidget {
  final Player player;

  const HeaderBlock(this.player);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          ResourcesSection(player),
          DefconSection(player),
          MilitarySection(player),
        ],
      ),
    );
  }
}

class ResourcesSection extends StatelessWidget {
  final Player player;

  const ResourcesSection(this.player);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResourceLabel(
            player: player,
            resourceType: ResourceType.energy,
          ),
          const VBox(10),
          ResourceLabel(
            player: player,
            resourceType: ResourceType.population,
          ),
        ],
      ),
    );
  }
}

class DefconSection extends StatelessWidget {
  final Player player;

  const DefconSection(this.player);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Label(
            text: Localized.get.headerDefcon,
            color: Palette.textPrimary,
            weight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}

class MilitarySection extends StatelessWidget {
  final Player player;

  const MilitarySection(this.player);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MilitaryLabel(
            icon: Icons.shield,
            color: Palette.militaryDefenseMissiles,
            title: Localized.get.headerDefenseMissiles,
            value: Formatter.resourceRaw(player.defenseMissiles),
          ),
          const VBox(10),
          MilitaryLabel(
            icon: Icons.local_fire_department_rounded,
            color: Palette.militaryAttackMissiles,
            title: Localized.get.headerAttackMissiles,
            value: Formatter.resourceRaw(player.attackMissiles),
          ),
        ],
      ),
    );
  }
}

class ResourceLabel extends StatelessWidget {
  final Player player;
  final ResourceType resourceType;

  const ResourceLabel({
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
          label: '${resourceType.localized}:',
          text: Formatter.resource(player.resources.get(resourceType)),
          labelColor: Palette.textPrimary,
          textColor: Palette.textPrimary,
          labelSize: 14,
          textSize: 14,
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
          labelColor: Palette.textPrimary,
          textColor: Palette.textPrimary,
          labelSize: 14,
          textSize: 14,
        ),
      ],
    );
  }
}
