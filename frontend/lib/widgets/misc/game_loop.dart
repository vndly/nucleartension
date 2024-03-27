import 'package:flutter/material.dart';
import 'package:nucleartension/screens/game_screen.dart';
import 'package:nucleartension/states/game_state.dart';

class GameLoop extends StatefulWidget {
  final GameState state;

  const GameLoop(this.state);

  @override
  State<GameLoop> createState() => _GameLoopState();
}

class _GameLoopState extends State<GameLoop>
    with SingleTickerProviderStateMixin {
  late AnimationController _animation;
  final DateTime _initialTime = DateTime.now();
  double _previous = 0;

  //static const int CLOCK_RATE = 1;

  double get _currentTime =>
      DateTime.now().difference(_initialTime).inMilliseconds / 1000.0;

  @override
  void initState() {
    super.initState();
    _previous = _currentTime;
    _animation = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final double current = _currentTime;
        final double dt = current - _previous;

        //if (dt >= CLOCK_RATE) {
        _previous = current;
        widget.state.update(dt);
        //}

        return GameContent(widget.state);
      },
    );
  }
}
