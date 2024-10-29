import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/region.dart';

class RegionFirstLevelComponent extends PositionComponent {
  final Game game;
  final Region region;
  final Paint paint = Paint();

  RegionFirstLevelComponent({
    required this.game,
    required this.region,
    required super.size,
  }) {
    paint.color = Colors.red;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    canvas.drawCircle(
      center.toOffset(),
      size.x / 4,
      paint,
    );
  }
}
