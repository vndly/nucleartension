import 'package:dafluta/dafluta.dart';
import 'package:flutter/rendering.dart';
import 'package:nucleartension/domain/models/battlefield.dart';
import 'package:nucleartension/domain/models/game.dart';
import 'package:nucleartension/presentation/dialog/pause_dialog.dart';
import 'package:nucleartension/utils/navigation.dart';

class GameState extends BaseState {
  late final Game game;
  bool finished = false;

  GameState() {
    const Battlefield battlefield = Battlefield(
      id: '',
      size: Size(100, 100),
      regions: [],
    );

    game = Game(
      state: this,
      battlefield: battlefield,
      timeElapsed: 0,
    );
  }

  void onPause() {
    if (!finished) {
      PauseDialog.show(onResume: _onResume, onQuit: _onQuit);
    }
  }

  void _onResume() {}

  void _onQuit() => Delayed.post(Navigation.pop);

  void onTap() => game.unselectAllRegions();
}
