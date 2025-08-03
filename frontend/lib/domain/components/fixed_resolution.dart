import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class FixedResolutionExample extends FlameGame {
  FixedResolutionExample()
    : super(
        camera: CameraComponent.withFixedResolution(width: 100, height: 100),
        world: FixedResolutionWorld(),
      );

  @override
  FutureOr onLoad() {
    debugMode = true;

    /*camera.moveTo(
      Vector2(-battlefield.size.width / 2, -battlefield.size.height / 2),
    );*/

    return super.onLoad();
  }

  @override
  Color backgroundColor() => Colors.white;
}

class FixedResolutionWorld extends World {
  @override
  Future<void> onLoad() async {
    add(Background());
  }
}

class Background extends PositionComponent with GestureHitboxes {
  Background()
    : super(
        position: Vector2(0, 0),
        size: Vector2(20, 20),
        anchor: Anchor.center,
      );

  @override
  Future onLoad() async {
    await super.onLoad();
    add(CircleHitbox());
  }

  @override
  void render(Canvas canvas) {
    final Paint paint = Paint()..color = Colors.green;
    canvas.drawCircle(const Offset(0, 0), 10, paint);

    final Paint paint2 = Paint()..color = Colors.red;
    canvas.drawRect(const Rect.fromLTRB(0, 0, 10, 10), paint2);
  }
}
