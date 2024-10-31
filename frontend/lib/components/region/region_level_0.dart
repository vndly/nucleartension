import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/extensions/canvas_extension.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/region.dart';

class RegionLevel0Component extends PositionComponent {
  final Game game;
  final Region region;

  RegionLevel0Component({
    required this.game,
    required this.region,
    required super.size,
  });

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final double textSize = size.x / 15;

    canvas.drawText(
      text: '👤 ${region.population.floor()}',
      color: Colors.white,
      size: textSize,
      alignment: TextAlign.center,
      position: Vector2(size.x / 2, size.y * 0.25),
    );

    canvas.drawText(
      text: '🚀 7/10',
      color: Colors.white,
      size: textSize,
      alignment: TextAlign.center,
      position: Vector2(size.x / 2, size.y * 0.4),
    );

    canvas.drawText(
      text: '🛡️ 4  💥 3',
      color: Colors.white,
      size: textSize,
      alignment: TextAlign.center,
      position: Vector2(size.x / 2, size.y * 0.55),
    );
  }
}
