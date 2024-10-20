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

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 7;
    final double gap = radius * 1.3;

    canvas.drawCircle(
      Offset(
        (size.width / 2) - gap,
        (size.height / 2) - gap,
      ),
      radius,
      circle1Paint,
    );

    canvas.drawCircle(
      Offset(
        (size.width / 2) + gap,
        (size.height / 2) - gap,
      ),
      radius,
      circle2Paint,
    );

    canvas.drawCircle(
      Offset(
        (size.width / 2) - gap,
        (size.height / 2) + gap,
      ),
      radius,
      circle3Paint,
    );

    canvas.drawCircle(
      Offset(
        (size.width / 2) + gap,
        (size.height / 2) + gap,
      ),
      radius,
      circle4Paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
