import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/region.dart';

class RegionComponent extends PositionComponent
    with TapCallbacks, GestureHitboxes {
  final Region region;
  final Paint paintBorder = Paint();
  final Paint paintFill = Paint();

  RegionComponent({
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
  void onTapUp(TapUpEvent event) => region.onTap();

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    paintBorder.color = region.color;
    paintFill.color = region.color.withAlpha(200);

    if (region.selected) {
      canvas.drawPath(_path, paintFill);
    }

    canvas.drawPath(_path, paintBorder);
  }

  List<Vector2> get _points {
    const double aaa = 0.575;
    final List<Vector2> result = [];

    for (int i = 0; i < 6; i++) {
      final double angle = i * 2 * pi / 6;
      final double x = size.x / 2 + size.x * aaa * cos(angle);
      final double y = size.y / 2 + size.y * aaa * sin(angle);

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
