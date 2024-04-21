import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/research_type.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/widgets/blocks/block_title.dart';
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
          ResearchResources(game.self),
          ResearchMissiles(game.self),
          ResearchWarning(game.self),
          ResearchMilitary(game.self),
          ResearchWeapons(game.self),
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
        BlockTitle(Localized.get.screenResearchResources),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research: player.getResearch(ResearchType.resources_grid_management),
        ),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research: player.getResearch(ResearchType.resources_production_chain),
        ),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research:
              player.getResearch(ResearchType.resources_quantum_computing),
        ),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research: player.getResearch(ResearchType.resources_indoctrination),
        ),
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
        BlockTitle(Localized.get.screenResearchMissiles),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research:
              player.getResearch(ResearchType.missiles_additive_manufacturing),
        ),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research:
              player.getResearch(ResearchType.missiles_assembly_automation),
        ),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research: player.getResearch(ResearchType.missiles_active_tracking),
        ),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research: player.getResearch(ResearchType.missiles_signal_jamming),
        ),
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
        BlockTitle(Localized.get.screenResearchWarning),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research:
              player.getResearch(ResearchType.warning_missiles_radar_network),
        ),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research: player
              .getResearch(ResearchType.warning_missiles_hypersonic_propulsion),
        ),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research:
              player.getResearch(ResearchType.warning_military_early_warning),
        ),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research: player
              .getResearch(ResearchType.warning_military_fast_deployments),
        ),
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
        BlockTitle(Localized.get.screenResearchUnits),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research: player.getResearch(ResearchType.unit_infantry_cost),
        ),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research: player.getResearch(ResearchType.unit_infantry_time),
        ),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research: player.getResearch(ResearchType.unit_vehicles_cost),
        ),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research: player.getResearch(ResearchType.unit_vehicles_time),
        ),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research: player.getResearch(ResearchType.unit_aircraft_cost),
        ),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research: player.getResearch(ResearchType.unit_aircraft_time),
        ),
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
        BlockTitle(Localized.get.screenResearchWeapons),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research: player.getResearch(ResearchType.weapons_nuclear_bomb),
        ),
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
        BlockTitle(Localized.get.screenResearchIntel),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research: player.getResearch(ResearchType.intel_population),
        ),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research: player.getResearch(ResearchType.intel_military),
        ),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research: player.getResearch(ResearchType.intel_missiles),
        ),
        const BlockSeparator(),
        ResearchBlock(
          player: player,
          research: player.getResearch(ResearchType.intel_research),
        ),
      ],
    );
  }
}
