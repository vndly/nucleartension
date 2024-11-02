import 'dart:math';
import 'package:dafluta/dafluta.dart';
import 'package:flame/components.dart';
import 'package:flutter/rendering.dart';
import 'package:nucleartension/dialog/information_dialog.dart';
import 'package:nucleartension/dialog/pause_dialog.dart';
import 'package:nucleartension/extensions/duration_extension.dart';
import 'package:nucleartension/models/battlefield.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/players/active_player.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/players/self_player.dart';
import 'package:nucleartension/models/region.dart';
import 'package:nucleartension/types/country.dart';
import 'package:nucleartension/utils/navigation.dart';

class GameState extends BaseState {
  late final Game game;
  bool finished = false;

  GameState() {
    const Size mapSize = Size(100, 100);
    final double radius = mapSize.height / 6;

    final Region centerRegion = Region(
      id: '0',
      position: Vector2(
        0,
        0,
      ),
      radius: radius,
      totalSlots: 10,
      population: 0,
      propaganda: 0,
    );

    final Region topRegion = Region(
      id: '1',
      position: Vector2(
        0,
        -radius * 2,
      ),
      radius: radius,
      totalSlots: 5,
      population: 0,
      propaganda: 0,
    );

    final Region topRightRegion = Region(
      id: '2',
      position: Vector2(
        radius * sqrt(3),
        -radius,
      ),
      radius: radius,
      totalSlots: 3,
      population: 100,
      propaganda: 0,
    );

    final Region bottomRightRegion = Region(
      id: '3',
      position: Vector2(
        radius * sqrt(3),
        radius,
      ),
      radius: radius,
      totalSlots: 5,
      population: 0,
      propaganda: 0,
    );

    final Region bottomRegion = Region(
      id: '4',
      position: Vector2(
        0,
        radius * 2,
      ),
      radius: radius,
      totalSlots: 3,
      population: 100,
      propaganda: 0,
    );

    final Region bottomLeftRegion = Region(
      id: '5',
      position: Vector2(
        -radius * sqrt(3),
        radius,
      ),
      radius: radius,
      totalSlots: 5,
      population: 0,
      propaganda: 0,
    );

    final Region topLeftRegion = Region(
      id: '6',
      position: Vector2(
        -radius * sqrt(3),
        -radius,
      ),
      radius: radius,
      totalSlots: 3,
      population: 100,
      propaganda: 0,
    );

    final Battlefield battlefield = Battlefield(
      size: mapSize,
      regions: [
        centerRegion,
        topRegion,
        topRightRegion,
        bottomRightRegion,
        bottomRegion,
        bottomLeftRegion,
        topLeftRegion,
      ],
    );

    game = Game(
      state: this,
      battlefield: battlefield,
      players: [],
      events: [],
      attacks: [],
      timeElapsed: 0,
      defcon: 5,
    );

    final Player usa = SelfPlayer(
      game: game,
      name: 'John',
      country: Country.usa,
      researches: {},
      energy: 1000,
    );

    final Player china = _activePlayer(
      name: 'Ming',
      country: Country.china,
      profile: PlayerProfile.neutral(),
    );

    final Player russia = _activePlayer(
      name: 'Sergey',
      country: Country.russia,
      profile: PlayerProfile.aggressiveMissiles(),
    );

    topLeftRegion.player = china;
    topRightRegion.player = russia;
    bottomRegion.player = usa;

    game.addPlayers([
      usa,
      china,
      russia,
    ]);
  }

  Player _activePlayer({
    required String name,
    required Country country,
    required PlayerProfile profile,
  }) =>
      ActivePlayer(
        game: game,
        name: name,
        country: country,
        researches: {},
        energy: 1000,
        profile: profile,
      );

  void onPause() {
    if (!finished) {
      PauseDialog.show(
        onResume: _onResume,
        onQuit: _onQuit,
      );
    }
  }

  void _onResume() {}

  void _onQuit() => Delayed.post(Navigation.pop);

  void onPlayerWon() {
    finished = true;
    InformationDialog.playerWon(
      time: Duration(seconds: game.timeElapsed.floor()).formatted,
      onAccept: _onQuit,
    );
  }

  void onPlayerLost(Player killer) {
    finished = true;
    InformationDialog.playerLost(
      killer: killer,
      onAccept: _onQuit,
    );
  }

  void onTap() => game.unselectAllRegions();
}
