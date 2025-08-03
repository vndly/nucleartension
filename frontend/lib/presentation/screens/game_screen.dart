import 'package:flutter/material.dart';
import 'package:nucleartension/domain/states/game_state.dart';
import 'package:nucleartension/presentation/widgets/hud/map_view.dart';
import 'package:nucleartension/utils/palette.dart';

class GameScreen extends StatelessWidget {
  final GameState state;

  const GameScreen(this.state);

  factory GameScreen.instance() => GameScreen(GameState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameContent(state),
    );
  }
}

class GameContent extends StatelessWidget {
  final GameState state;

  const GameContent(this.state);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: state.onTap,
      child: Container(
        color: Palette.transparent,
        child: Center(child: MapView(state)),
      ),
    );
  }
}
