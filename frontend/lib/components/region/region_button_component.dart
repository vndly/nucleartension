import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/extensions/canvas_extension.dart';
import 'package:nucleartension/models/game.dart';

class RegionButtonComponent extends PositionComponent {
  final Game game;
  final double dimension;
  final String icon;
  final String title;
  final Color color;
  final Paint paintForeground = Paint();
  final Paint paintBackground = Paint();

  RegionButtonComponent({
    required this.game,
    required this.dimension,
    required this.icon,
    required this.title,
    required this.color,
    required super.position,
  }) {
    paintForeground.color = color;
    paintBackground.color = Colors.white;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    canvas.drawCircle(
      const Offset(0, 0),
      dimension * 1.05,
      paintBackground,
    );

    canvas.drawCircle(
      const Offset(0, 0),
      dimension,
      paintForeground,
    );

    canvas.drawText(
      text: icon,
      color: Colors.white,
      size: dimension,
      alignment: TextAlign.center,
      position: Vector2(0, dimension * -0.2),
    );

    canvas.drawText(
      text: title,
      color: Colors.white,
      size: dimension / 1.5,
      alignment: TextAlign.left,
      position: Vector2(dimension * 1.5, 0),
    );
  }
}
