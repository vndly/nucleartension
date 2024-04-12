import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/players/player.dart';
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
          HeaderBlock(game.self),
          ResearchResources(game.self),
          ResearchMissiles(game.self),
          ResearchWarning(game.self),
          ResearchMilitary(game.self),
          ResearchWeapons(game.self),
          ResearchResilience(game.self),
          ResearchIntel(game.self),
        ],
      ),
    );
  }
}

class ResearchResources extends StatelessWidget {
  final Player player;

  const ResearchResources(this.player);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BlockSeparator(),
        const BlockTitle('RESOURCES'),
        const BlockSeparator(),
        ResearchBlock(
            player.getResearch(ResearchType.resources_grid_management)),
        const BlockSeparator(),
        ResearchBlock(
            player.getResearch(ResearchType.resources_production_chain)),
        const BlockSeparator(),
        ResearchBlock(
            player.getResearch(ResearchType.resources_indoctrination)),
        const BlockSeparator(),
        ResearchBlock(
            player.getResearch(ResearchType.resources_quantum_computing)),
      ],
    );
  }
}

class ResearchMissiles extends StatelessWidget {
  final Player player;

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
        ResearchBlock(
            player.getResearch(ResearchType.missiles_active_tracking)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.missiles_signal_jamming)),
      ],
    );
  }
}

class ResearchWarning extends StatelessWidget {
  final Player player;

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
  final Player player;

  const ResearchMilitary(this.player);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BlockSeparator(),
        const BlockTitle('MILITARY'),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.military_infantry_cost)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.military_infantry_time)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.military_vehicles_cost)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.military_vehicles_time)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.military_aircraft_cost)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.military_aircraft_time)),
      ],
    );
  }
}

class ResearchWeapons extends StatelessWidget {
  final Player player;

  const ResearchWeapons(this.player);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BlockSeparator(),
        const BlockTitle('WEAPONS'),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.weapons_nuclear_bomb)),
      ],
    );
  }
}

class ResearchResilience extends StatelessWidget {
  final Player player;

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
  final Player player;

  const ResearchIntel(this.player);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BlockSeparator(),
        const BlockTitle('INTEL'),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.intel_economy)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.intel_military)),
        const BlockSeparator(),
        ResearchBlock(player.getResearch(ResearchType.intel_technology)),
      ],
    );
  }
}
