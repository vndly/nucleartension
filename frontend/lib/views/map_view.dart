import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';

class MapView extends StatelessWidget {
  final Game game;

  const MapView(this.game);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        width: constraints.maxWidth,
        height: constraints.maxWidth,
        child: CustomPaint(
          foregroundPainter: ForegroundPainter(),
          painter: BackgroundPainter(),
          child: MiddleLayer(),
        ),
      ),
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

class MiddleLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromLTRB(0, 0, size.width, size.height),
      Paint()..color = Colors.red,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
