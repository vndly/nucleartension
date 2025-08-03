import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class FixedResolutionExample extends FlameGame {
  FixedResolutionExample()
    : super(
        camera: CameraComponent.withFixedResolution(width: 100, height: 100),
        world: FixedResolutionWorld(),
      );
}

class FixedResolutionWorld extends World with HasGameReference {
  @override
  Future<void> onLoad() async {
    add(Background());
  }
}

class Background extends PositionComponent {
  late Paint white;
  late final Rect hugeRect;

  Background() : super(size: Vector2.all(100), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    white = BasicPalette.white.paint();
    hugeRect = size.toRect();
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(hugeRect, white);

    final Paint paint = Paint()..color = Colors.green;
    canvas.drawCircle(const Offset(0, 0), 10, paint);
  }
}
