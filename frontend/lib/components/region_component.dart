import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/region.dart';

class RegionComponent extends PositionComponent with TapCallbacks {
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
  void onTapUp(TapUpEvent event) {
    event.continuePropagation = true;
    print('TEST 2: ${region.id} ${event.localPosition}');
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
