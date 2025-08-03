import 'package:dafluta/dafluta.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/domain/states/game_state.dart';

class MapView extends StatelessWidget {
  final GameState state;

  const MapView(this.state);

  @override
  Widget build(BuildContext context) {
    return StateProvider<GameState>(
      state: state,
      builder: (context, state) {
        if (state.hasGame) {
          return Padding(
            padding: const EdgeInsets.all(50),
            child: AspectRatio(
              aspectRatio: state.game.battlefield.ratio,
              child: GameWidget(game: state.game),
            ),
          );
        } else {
          return const Empty();
        }
      },
    );
  }
}
