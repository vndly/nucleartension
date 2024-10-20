import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/region.dart';

class RegionComponent extends PositionComponent {
  final Region region;
  final Paint paintBorder = Paint();
  final Paint paintFill = Paint();

  RegionComponent(this.region)
      : super(
          position: region.position,
          size: Vector2.all(region.radius * 2),
          anchor: Anchor.center,
        ) {
    paintBorder.style = PaintingStyle.stroke;
    paintFill.style = PaintingStyle.fill;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    paintBorder.color = region.color;
    paintFill.color = region.color.withAlpha(200);

    canvas.drawCircle(
      Offset(
        size.x / 2,
        size.y / 2,
      ),
      size.x / 2,
      paintFill,
    );

    canvas.drawCircle(
      Offset(
        size.x / 2,
        size.y / 2,
      ),
      size.x / 2,
      paintBorder,
    );
  }
}
