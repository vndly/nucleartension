import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/domain/models/region.dart';
import 'package:nucleartension/utils/palette.dart';

class RegionComponent extends PositionComponent
    with TapCallbacks, GestureHitboxes {
  final Region region;
  final Paint paintBorder = Palette.paint(
    color: Colors.white,
    strokeWidth: 0.5,
    style: PaintingStyle.stroke,
  );

  RegionComponent({
    required this.region,
  }) : super(
         anchor: Anchor.center,
         position: region.position,
         size: region.size,
       );

  @override
  Future onLoad() async {
    await super.onLoad();
    add(CircleHitbox());
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    _painBackground(canvas);

    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: '${region.slots} slots',
        style: const TextStyle(color: Colors.white, fontSize: 3),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final Offset offset = Offset(
      size.x / 2 - textPainter.width / 2,
      size.y / 2 - textPainter.height / 2,
    );
    textPainter.paint(canvas, offset);
  }

  void _painBackground(Canvas canvas) {
    canvas.drawPath(_path, paintBorder);
  }

  Path get _path {
    final Path result = Path();
    final List<Vector2> vertices = region.vertices;
    result.moveTo(vertices[0].x - position.x, vertices[0].y - position.y);

    for (int i = 1; i < vertices.length; i++) {
      result.lineTo(vertices[i].x - position.x, vertices[i].y - position.y);
    }

    result.close();

    return result;
  }
}
