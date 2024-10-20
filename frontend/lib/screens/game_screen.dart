import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/states/game_state.dart';
import 'package:nucleartension/widgets/hud/map_view.dart';
import 'package:nucleartension/widgets/hud/top_menu.dart';
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
    return StateProvider<GameState>(
      state: state,
      builder: (context, state) => Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: MapView(state),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: TopMenu(state),
          ),
        ],
      ),
    );
  }
}
