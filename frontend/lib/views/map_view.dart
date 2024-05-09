import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';

class MapView extends StatelessWidget {
  final Game game;

  const MapView(this.game);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: ForegroundPainter(),
      child: MiddleLayer(),
    );
  }
}

class MiddleLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }
}

class ForegroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      const Offset(0, 0),
      Offset(size.width, size.height),
      Paint()
        ..color = Colors.green
        ..strokeWidth = size.width / 100,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
