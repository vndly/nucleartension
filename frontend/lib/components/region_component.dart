import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/region.dart';

class RegionComponent extends PositionComponent
    with TapCallbacks, GestureHitboxes {
  final Game game;
  final Region region;
  final Paint paintBorder = Paint();
  final Paint paintFill = Paint();
  MenuState menuState = MenuState.hidden;

  RegionComponent({
    required this.game,
    required this.region,
    required super.position,
    required super.size,
  }) : super(anchor: Anchor.center) {
    paintBorder.style = PaintingStyle.stroke;
    paintBorder.strokeWidth = 0.5;

    paintFill.style = PaintingStyle.fill;
  }

  @override
  Future onLoad() async {
    super.onLoad();
    add(CircleHitbox());
  }

  @override
  void onTapUp(TapUpEvent event) {
    /*final Vector2 diffFromCenter = event.localPosition - (size / 2);

    game.onRegionSelected(
      region: region,
      diffFromCenter: diffFromCenter,
      devicePosition: event.devicePosition,
    );*/

    if (menuState == MenuState.hidden) {
      menuState = MenuState.first_level;
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    _painBackground(canvas);
    _paintForeground(canvas);
  }

  void _painBackground(Canvas canvas) {
    paintBorder.color = region.color;
    paintFill.color = region.color.withAlpha(75);

    if (region.selected) {
      canvas.drawPath(_path, paintFill);
    }

    canvas.drawPath(_path, paintBorder);
  }

  void _paintForeground(Canvas canvas) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: region.id,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 5,
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

  List<Vector2> get _points {
    const double ratio = 0.57;
    final List<Vector2> result = [];

    for (int i = 0; i < 6; i++) {
      final double angle = i * 2 * pi / 6;
      final double x = size.x / 2 + size.x * ratio * cos(angle);
      final double y = size.y / 2 + size.y * ratio * sin(angle);

      result.add(Vector2(x, y));
    }

    return result;
  }

  Path get _path {
    final Path result = Path();
    final List<Vector2> points = _points;
    result.moveTo(points[0].x, points[0].y);

    for (int i = 1; i < points.length; i++) {
      result.lineTo(points[i].x, points[i].y);
    }

    result.close();

    return result;
  }
}

enum MenuState {
  hidden,
  first_level,
}