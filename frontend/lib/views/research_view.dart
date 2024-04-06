import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
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
          const BlockSeparator(),
          const BlockTitle('RESOURCES'),
          const BlockSeparator(),
          ResearchBlock(game.player.getResearch(ResearchType.resources_energy)),
          const BlockSeparator(),
          ResearchBlock(
              game.player.getResearch(ResearchType.resources_supplies)),
          const BlockSeparator(),
          ResearchBlock(
              game.player.getResearch(ResearchType.resources_population)),
          const BlockSeparator(),
          ResearchBlock(
              game.player.getResearch(ResearchType.resources_technology)),
          const BlockSeparator(),
          const BlockTitle('MISSIES'),
          const BlockSeparator(),
          ResearchBlock(game.player
              .getResearch(ResearchType.missiles_additive_manufacturing)),
          const BlockSeparator(),
          ResearchBlock(game.player
              .getResearch(ResearchType.missiles_assembly_automation)),
          const BlockSeparator(),
          ResearchBlock(game.player
              .getResearch(ResearchType.missiles_enhanced_guidance_systems)),
          const BlockSeparator(),
          ResearchBlock(
              game.player.getResearch(ResearchType.missiles_signal_jamming)),
          const BlockSeparator(),
        ],
      ),
    );
  }
}
