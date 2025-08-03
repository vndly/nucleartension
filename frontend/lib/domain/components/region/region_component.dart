import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/domain/models/game.dart';
import 'package:nucleartension/domain/models/region.dart';

class RegionComponent extends PositionComponent
    with TapCallbacks, GestureHitboxes {
  final Game game;
  final Region region;
  late final Paint paintBorder;

  RegionComponent({
    required this.game,
    required this.region,
  }) : super(
         anchor: Anchor.center,
         position: region.position,
         size: region.size,
       ) {
    paintBorder = normalPaint(
      color: Colors.white,
      strokeWidth: 0.5,
      style: PaintingStyle.stroke,
    );
  }

  @override
  Future onLoad() async {
    await super.onLoad();
    add(CircleHitbox());
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    _painBackground(canvas);

    final textPainter = TextPainter(
      text: TextSpan(
        text: '${region.slots} slots',
        style: const TextStyle(color: Colors.white, fontSize: 3),
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

  void _painBackground(Canvas canvas) {
    canvas.drawPath(_path, paintBorder);
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

  static Paint normalPaint({
    required Color color,
    required double strokeWidth,
    PaintingStyle style = PaintingStyle.stroke,
  }) {
    final Paint paint = Paint();
    paint.style = style;
    paint.isAntiAlias = true;
    paint.color = color;
    paint.strokeWidth = strokeWidth;

    return paint;
  }
}
