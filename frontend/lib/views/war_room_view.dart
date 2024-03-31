import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/widgets/blocks/header_block.dart';

class WarRoomView extends StatelessWidget {
  final Game game;

  const WarRoomView(this.game);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderBlock(game.player),
        ],
      ),
    );
  }
}
