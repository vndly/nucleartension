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
          ResearchBlock(game.player.getResearch(ResearchType.energy)),
          const BlockSeparator(),
          ResearchBlock(game.player.getResearch(ResearchType.supplies)),
          const BlockSeparator(),
          ResearchBlock(game.player.getResearch(ResearchType.population)),
          const BlockSeparator(),
          ResearchBlock(game.player.getResearch(ResearchType.technology)),
          const BlockSeparator(),
        ],
      ),
    );
  }
}
