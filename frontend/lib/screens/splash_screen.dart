import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/states/splash_state.dart';
import 'package:nucleartension/widgets/misc/game_container.dart';

class SplashScreen extends StatelessWidget {
  final SplashState state;

  const SplashScreen(this.state);

  factory SplashScreen.instance() => SplashScreen(SplashState());

  @override
  Widget build(BuildContext context) {
    return const GameContainer(
      child: Center(
        child: Empty(),
        /*CircularProgressIndicator(
          color: Palette.loader,
        ),*/
      ),
    );
  }
}
