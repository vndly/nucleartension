import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/region.dart';

class RegionOwnComponent extends PositionComponent {
  final Game game;
  final Region region;

  RegionOwnComponent({
    required this.game,
    required this.region,
    required super.size,
  });

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final textPainter = TextPainter(
      text: TextSpan(
        text: '👤 ${region.population}',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 3,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final offset = Offset(
      size.x / 2 - textPainter.width / 2,
      size.y / 2 - textPainter.height / 2,
    );
    textPainter.paint(canvas, offset);
  }
}
