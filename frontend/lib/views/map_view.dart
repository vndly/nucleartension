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
      Paint()..color = Colors.green,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MiddleLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0x88ff0000),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 4,
      Paint()..color = Colors.blue,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
