import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/domain/models/region.dart';
import 'package:nucleartension/extensions/canvas_extension.dart';
import 'package:nucleartension/utils/palette.dart';

class RegionComponent extends PositionComponent with GestureHitboxes {
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
    _painBackground(canvas);

    canvas.drawText(
      text:
          '${region.slots} slots / ${position.x.toInt()}, ${position.y.toInt()}',
      position: Vector2(0, 0),
      size: size.x / 20,
      color: Colors.white,
      anchor: Anchor.center,
      textAlign: TextAlign.center,
    );
  }

  void _painBackground(Canvas canvas) {
    canvas.drawPath(_path, paintBorder);
  }

  Path get _path {
    final Path result = Path();
    final List<Vector2> vertices = region.vertices;
    /*result.moveTo(
      vertices[0].x - position.x + (size.x / 2),
      vertices[0].y - position.y + (size.y / 2),
    );

    for (int i = 1; i < vertices.length; i++) {
      result.lineTo(
        vertices[i].x - position.x + (size.x / 2),
        vertices[i].y - position.y + (size.y / 2),
      );
    }*/

    result.moveTo(
      vertices[0].x,
      vertices[0].y,
    );

    for (int i = 1; i < vertices.length; i++) {
      result.lineTo(
        vertices[i].x,
        vertices[i].y,
      );
    }

    result.close();

    return result;
  }
}
