import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/states/game_state.dart';

class MapView extends StatelessWidget {
  final GameState state;

  const MapView(this.state);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: AspectRatio(
        aspectRatio: state.game.battlefield.ratio,
        child: GameWidget(game: state.game),
      ),
    );
  }
}
