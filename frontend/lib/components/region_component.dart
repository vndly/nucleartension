import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/players/player.dart';

class RegionComponent extends PositionComponent {
  Player? player;
  late final Paint paint;

  RegionComponent({
    required super.position,
    required super.size,
    this.player,
  }) : super(anchor: Anchor.center) {
    paint = Paint()
      ..color = player?.country.color ?? Colors.grey
      ..style = PaintingStyle.fill;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    canvas.drawCircle(
      Offset(
        size.x / 2,
        size.y / 2,
      ),
      size.x / 2,
      paint,
    );
  }
}
