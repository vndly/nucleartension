import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/domain/components/battlefield_component.dart';
import 'package:nucleartension/domain/models/battlefield.dart';
import 'package:nucleartension/domain/states/game_state.dart';

class GameComponent extends FlameGame with TapCallbacks {
  final GameState state;
  final Battlefield battlefield;
  num timeElapsed = 0;

  GameComponent({
    required this.state,
    required this.battlefield,
    required this.timeElapsed,
  }) : super(
         camera: CameraComponent.withFixedResolution(
           width: battlefield.size.width,
           height: battlefield.size.height,
         ),
         world: BattlefieldComponent(battlefield: battlefield),
       ) {
    debugMode = true;
  }

  @override
  FutureOr onLoad() {
    add(
      FpsTextComponent(
        position: Vector2(0, 0),
        textRenderer: TextPaint(
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );

    return super.onLoad();
  }

  @override
  Color backgroundColor() => Colors.grey;

  // ============================= REGIONS ================================== \\

  @override
  void update(double dt) {
    super.update(dt);
    timeElapsed += dt;
  }

  @override
  void onTapUp(TapUpEvent event) => unselectAllRegions();

  void unselectAllRegions() {
    final BattlefieldComponent battlefieldComponent =
        world as BattlefieldComponent;
    battlefieldComponent.unselectAllRegions();
  }
}
