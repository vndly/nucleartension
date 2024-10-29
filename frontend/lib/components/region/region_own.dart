import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/extensions/canvas_extension.dart';
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

    canvas.drawText(
      text: '👤 ${region.population}',
      color: Colors.white,
      size: 3,
      alignment: TextAlign.center,
      position: size / 2,
    );
  }
}
