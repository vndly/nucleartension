import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nucleartension/states/game_state.dart';
import 'package:nucleartension/utils/palette.dart';

class MapView extends StatelessWidget {
  final GameState state;

  const MapView(this.state);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      child: CustomPaint(
        foregroundPainter: ForegroundPainter(),
        child: MiddleLayer(),
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    print('TAP: ${details.localPosition}');
  }
}

class MiddleLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.backgroundContainer,
    );
  }
}

class ForegroundPainter extends CustomPainter {
  final Paint circle1Paint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.fill;

  final Paint circle2Paint = Paint()
    ..color = Colors.green
    ..style = PaintingStyle.fill;

  final Paint circle3Paint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.fill;

  final Paint circle4Paint = Paint()
    ..color = Colors.yellow
    ..style = PaintingStyle.fill;

  final Paint circle5Paint = Paint()
    ..color = Colors.pink
    ..style = PaintingStyle.fill;

  final Paint circle6Paint = Paint()
    ..color = Colors.brown
    ..style = PaintingStyle.fill;

  final Paint circle7Paint = Paint()
    ..color = Colors.purple
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    final double length = size.height * 0.8;
    final double radius = length / 6;

    canvas.drawCircle(
      Offset(
        size.width / 2,
        size.height / 2,
      ),
      radius,
      circle1Paint,
    );

    canvas.drawCircle(
      Offset(
        size.width / 2,
        (size.height / 2) - (radius * 2),
      ),
      radius,
      circle2Paint,
    );

    canvas.drawCircle(
      Offset(
        size.width / 2,
        (size.height / 2) + (radius * 2),
      ),
      radius,
      circle3Paint,
    );

    canvas.drawCircle(
      Offset(
        (size.width / 2) + (radius * sqrt(3)),
        (size.height / 2) + radius,
      ),
      radius,
      circle4Paint,
    );

    canvas.drawCircle(
      Offset(
        (size.width / 2) + (radius * sqrt(3)),
        (size.height / 2) - radius,
      ),
      radius,
      circle5Paint,
    );

    canvas.drawCircle(
      Offset(
        (size.width / 2) - (radius * sqrt(3)),
        (size.height / 2) + radius,
      ),
      radius,
      circle6Paint,
    );

    canvas.drawCircle(
      Offset(
        (size.width / 2) - (radius * sqrt(3)),
        (size.height / 2) - radius,
      ),
      radius,
      circle7Paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
