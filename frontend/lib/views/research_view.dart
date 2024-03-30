import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class ResearchView extends StatelessWidget {
  final Game game;

  const ResearchView(this.game);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Label(
        text: 'RESEARCH',
        color: Palette.textLight,
      ),
    );
  }
}
