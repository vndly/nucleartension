import 'dart:html';
import 'package:flutter/foundation.dart';
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
  //double _previous = 0;
  AppLifecycleState state = AppLifecycleState.resumed;

  double get _currentTime =>
      DateTime.now().difference(_initialTime).inMilliseconds / 1000.0;

  @override
  void initState() {
    super.initState();
    //_previous = _currentTime;
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
    return UniversalLifecycleWatcher(
      onChange: _onLifecycleChange,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          //final double current = _currentTime;
          //final double dt = current - _previous;

          //_previous = current;

          /*if (state == AppLifecycleState.resumed) {
            widget.state.update(dt);
          }*/

          return GameContent(widget.state);
        },
      ),
    );
  }

  Future _onLifecycleChange(AppLifecycleState newState) async {
    if ((state != AppLifecycleState.resumed) &&
        (newState == AppLifecycleState.resumed)) {
      //_previous = _currentTime;
    }

    state = newState;
  }
}

class UniversalLifecycleWatcher extends StatefulWidget {
  final Widget child;
  final Function(AppLifecycleState) onChange;

  const UniversalLifecycleWatcher({
    required this.child,
    required this.onChange,
  });

  @override
  State<UniversalLifecycleWatcher> createState() =>
      _UniversalLifecycleWatcherState();
}

class _UniversalLifecycleWatcherState extends State<UniversalLifecycleWatcher>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    if (kIsWeb) {
      window.addEventListener('focus', onFocus);
      window.addEventListener('blur', onBlur);
    } else {
      WidgetsBinding.instance.addObserver(this);
    }
  }

  @override
  void dispose() {
    if (kIsWeb) {
      window.removeEventListener('focus', onFocus);
      window.removeEventListener('blur', onBlur);
    } else {
      WidgetsBinding.instance.removeObserver(this);
    }

    super.dispose();
  }

  void onFocus(Event e) =>
      didChangeAppLifecycleState(AppLifecycleState.resumed);

  void onBlur(Event e) => didChangeAppLifecycleState(AppLifecycleState.paused);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) =>
      widget.onChange(state);

  @override
  Widget build(BuildContext context) => widget.child;
}
