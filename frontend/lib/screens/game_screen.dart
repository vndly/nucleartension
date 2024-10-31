import 'package:flutter/material.dart';
import 'package:nucleartension/states/game_state.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/hud/map_view.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class GameScreen extends StatelessWidget {
  final GameState state;

  const GameScreen(this.state);

  factory GameScreen.instance() => GameScreen(GameState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: state.finished,
        onPopInvokedWithResult: (didPop, result) => state.onPause(),
        child: GameContent(state),
      ),
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
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: MapView(state),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Label(text: 'FPS: ${state.game.fps.fps()}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
