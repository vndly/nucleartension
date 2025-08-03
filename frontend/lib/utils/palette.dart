import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor primary = Colors.blue;

  static const Color transparent = Colors.transparent;

  static const Color success = Colors.green;
  static const Color error = Colors.red;

  static const Color textPrimary = Colors.white;

  static const Color iconLevel1 = Color(0xffffffff);

  static const Color backgroundContainer = Colors.black;
  static const Color backgroundScreen = Color(0xff101010);
  static const Color backgroundSnackbar = Color(0xff101010);
  static const Color backgroundDialog = Color(0xff404040);

  static const Color borderSeparator = Color(0xff505050);

  static const Color buttonEnabled = Color(0xff279b2b);
  static const Color buttonBlocked = Color(0xff606060);

  static Paint paint({
    PaintingStyle? style,
    Color? color,
    double? strokeWidth,
    StrokeCap? strokeCap,
    StrokeJoin? strokeJoin,
  }) {
    final Paint paint = Paint();

    if (color != null) {
      paint.color = color;
    }

    if (strokeWidth != null) {
      paint.strokeWidth = strokeWidth;
    }

    if (style != null) {
      paint.style = style;
    }

    if (strokeCap != null) {
      paint.strokeCap = strokeCap;
    }

    if (strokeJoin != null) {
      paint.strokeJoin = strokeJoin;
    }

    return paint;
  }
}
