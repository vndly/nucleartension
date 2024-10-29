import 'package:flame/components.dart';
import 'package:flutter/painting.dart';

extension CanvasExtension on Canvas {
  void drawText({
    required String text,
    required Color color,
    required double size,
    required TextAlign alignment,
    required Vector2 position,
  }) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: size,
        ),
      ),
      textAlign: alignment,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final offset = Offset(
      position.x - textPainter.width / 2,
      position.y - textPainter.height / 2,
    );
    textPainter.paint(this, offset);
  }
}
