import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/players/self_player.dart';
import 'package:nucleartension/types/research_type.dart';
import 'package:nucleartension/widgets/blocks/block_title.dart';
import 'package:nucleartension/widgets/blocks/header_block.dart';
import 'package:nucleartension/widgets/blocks/research_block.dart';
import 'package:nucleartension/widgets/separators/block_separator.dart';

class ResearchView extends StatelessWidget {
  final Game game;

  const ResearchView(this.game);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderBlock(game.player),
          ResearchResources(game.player),
          ResearchMissiles(game.player),
          ResearchWarning(game.player),
          ResearchMilitary(game.player),
          ResearchWeapons(game.player),
          ResearchResilience(game.player),
          ResearchIntel(game.player),
          const BlockSeparator(),
        ],
      ),
    );
  }
}

class ResearchResources extends StatelessWidget {
  final SelfPlayer player;

  const ResearchResources(this.player);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BlockSeparator(),
        const BlockTitle('RESOURCES'),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.resources_energy)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.resources_supplies)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.resources_population)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.resources_technology)),
      ],
    );
  }
}

class ResearchMissiles extends StatelessWidget {
  final SelfPlayer player;

  const ResearchMissiles(this.player);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BlockSeparator(),
        const BlockTitle('MISSILES'),
        const BlockSeparator(),
        ResearchBlock(
            player.getResearch(ResearchType.missiles_additive_manufacturing)),
        const BlockSeparator(),
        ResearchBlock(
            player.getResearch(ResearchType.missiles_assembly_automation)),
        const BlockSeparator(),
        ResearchBlock(player
            .getResearch(ResearchType.missiles_enhanced_guidance_systems)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.missiles_signal_jamming)),
      ],
    );
  }
}

class ResearchWarning extends StatelessWidget {
  final SelfPlayer player;

  const ResearchWarning(this.player);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BlockSeparator(),
        const BlockTitle('WARNING'),
        const BlockSeparator(),
        ResearchBlock(
            player.getResearch(ResearchType.warning_missiles_radar_network)),
        const BlockSeparator(),
        ResearchBlock(player
            .getResearch(ResearchType.warning_missiles_hypersonic_propulsion)),
        const BlockSeparator(),
        ResearchBlock(
            player.getResearch(ResearchType.warning_military_early_warning)),
        const BlockSeparator(),
        ResearchBlock(
            player.getResearch(ResearchType.warning_military_fast_deployments)),
      ],
    );
  }
}

class ResearchMilitary extends StatelessWidget {
  final SelfPlayer player;

  const ResearchMilitary(this.player);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BlockSeparator(),
        const BlockTitle('MILITARY'),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.military_barracks_cost)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.military_barracks_time)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.military_factory_cost)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.military_factory_time)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.military_airfield_cost)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.military_airfield_time)),
      ],
    );
  }
}

class ResearchWeapons extends StatelessWidget {
  final SelfPlayer player;

  const ResearchWeapons(this.player);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BlockSeparator(),
        const BlockTitle('WEAPONS'),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.weapons_fission_bomb)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.weapons_fusion_bomb)),
      ],
    );
  }
}

class ResearchResilience extends StatelessWidget {
  final SelfPlayer player;

  const ResearchResilience(this.player);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BlockSeparator(),
        const BlockTitle('RESILIENCE'),
        const BlockSeparator(),
        ResearchBlock(
            player.getResearch(ResearchType.resilience_emergency_planning)),
      ],
    );
  }
}

class ResearchIntel extends StatelessWidget {
  final SelfPlayer player;

  const ResearchIntel(this.player);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BlockSeparator(),
        const BlockTitle('INTEL'),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.intel_economy_1)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.intel_economy_2)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.intel_military_1)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.intel_military_2)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.intel_technology_1)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.intel_technology_2)),
      ],
    );
  }
}
