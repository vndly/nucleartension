import 'package:flutter/material.dart';
import 'package:nucleartension/states/game_state.dart';
import 'package:nucleartension/widgets/hud/map_view.dart';
import 'package:nucleartension/widgets/hud/top_menu.dart';
import 'package:nucleartension/widgets/labels/label.dart';
import 'package:nucleartension/widgets/misc/game_loop.dart';

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
        child: GameLoop(state),
      ),
    );
  }
}

class GameContent extends StatelessWidget {
  final GameState state;

  const GameContent(this.state);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: MapView(state),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: TopMenu(state.game),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Label(text: 'FPS: ${state.game.fps.fps()}'),
          ),
        ),
        if (state.hasSelectedRegion)
          Positioned(
            top: state.selectedRegionPosition!.y,
            left: state.selectedRegionPosition!.x,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}
