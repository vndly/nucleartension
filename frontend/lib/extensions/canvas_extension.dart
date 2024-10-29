import 'package:flame/components.dart';
import 'package:flutter/painting.dart';
import 'package:nucleartension/app/constants.dart';

extension CanvasExtension on Canvas {
  void drawText({
    required String text,
    required Color color,
    required double size,
    required TextAlign alignment,
    required Vector2 position,
  }) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontFamily: Constants.FONT_NAME,
        ),
      ),
      textAlign: alignment,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final Offset offset = (alignment == TextAlign.center)
        ? Offset(
            position.x - textPainter.width / 2,
            position.y - textPainter.height / 2,
          )
        : Offset(
            position.x,
            position.y - textPainter.height / 4,
          );
    textPainter.paint(this, offset);
  }
}
