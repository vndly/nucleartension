import 'package:flutter/material.dart';
import 'package:nucleartension/domain/models/attacks/attack.dart';
import 'package:nucleartension/domain/models/game.dart';
import 'package:nucleartension/presentation/widgets/blocks/attack_block.dart';

class WarningBlock extends StatelessWidget {
  final Game game;

  const WarningBlock(this.game);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final Attack attack in game.selfAttacks) AttackBlock(attack),
      ],
    );
  }
}
