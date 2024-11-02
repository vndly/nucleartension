import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/extensions/canvas_extension.dart';
import 'package:nucleartension/models/game.dart';

class RegionButtonComponent extends PositionComponent
    with TapCallbacks, GestureHitboxes {
  final Game game;
  final double dimension;
  final String icon;
  final String title;
  final Color color;
  final VoidCallback onTap;
  final bool Function() isEnabled;
  final Paint paintForeground = Paint();
  final Paint paintBackground = Paint();

  RegionButtonComponent({
    required this.game,
    required this.dimension,
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
    required this.isEnabled,
    required super.position,
  }) {
    anchor = Anchor.center;
    size = Vector2(dimension * 2, dimension * 2);
    paintBackground.color = Colors.white;
  }

  @override
  Future onLoad() async {
    super.onLoad();
    add(CircleHitbox());
  }

  @override
  void onTapUp(TapUpEvent event) {
    if (isEnabled()) {
      onTap();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (isEnabled()) {
      paintForeground.color = color;
    } else {
      paintForeground.color = Colors.grey;
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    canvas.drawCircle(
      (size / 2).toOffset(),
      dimension * 1.05,
      paintBackground,
    );

    canvas.drawCircle(
      (size / 2).toOffset(),
      dimension,
      paintForeground,
    );

    canvas.drawText(
      text: icon,
      color: Colors.white,
      size: dimension,
      alignment: TextAlign.center,
      position: Vector2(size.x / 2, (size.y / 2) - (dimension * 0.2)),
    );

    canvas.drawText(
      text: title,
      color: Colors.white,
      size: dimension / 1.5,
      alignment: TextAlign.left,
      position: Vector2(
          (size.x / 2) + (dimension * 1.5), (size.y / 2) - (dimension * 0.05)),
    );
  }
}
