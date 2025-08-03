import 'dart:convert';
import 'package:dafluta/dafluta.dart';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'package:nucleartension/domain/components/game_component.dart';
import 'package:nucleartension/domain/json/json_battlefield.dart';
import 'package:nucleartension/domain/json/json_vertex.dart';
import 'package:nucleartension/domain/models/battlefield.dart';
import 'package:nucleartension/domain/models/region.dart';
import 'package:nucleartension/presentation/dialog/pause_dialog.dart';
import 'package:nucleartension/utils/assets.dart';
import 'package:nucleartension/utils/navigation.dart';

class GameState extends BaseState {
  FlameGame? _game;
  bool finished = false;

  @override
  Future onLoad() async {
    final String data = await rootBundle.loadString(Assets.JSON_TEST_MAP);
    final JsonBattlefield jsonBattlefield = JsonBattlefield.fromJson(
      jsonDecode(data),
    );

    final Battlefield battlefield = Battlefield(
      id: jsonBattlefield.id,
      size: Size(
        jsonBattlefield.width.toDouble(),
        jsonBattlefield.height.toDouble(),
      ),
      regions: jsonBattlefield.regions
          .map(
            (region) => Region(
              id: region.id,
              slots: region.slots,
              points: _vertices(region.vertices),
            ),
          )
          .toList(),
    );

    _game = GameComponent(
      state: this,
      battlefield: battlefield,
      timeElapsed: 0,
    );

    notify();
  }

  List<Vector2> _vertices(Vertices vertices) => vertices
      .map(
        (vertext) => Vector2(vertext[0].toDouble(), vertext[1].toDouble()),
      )
      .toList();

  bool get hasGame => _game != null;

  FlameGame get game => _game!;

  void onPause() {
    if (!finished) {
      PauseDialog.show(onResume: _onResume, onQuit: _onQuit);
    }
  }

  void _onResume() {}

  void _onQuit() => Delayed.post(Navigation.pop);

  void onTap() {} //_game?.unselectAllRegions();
}
