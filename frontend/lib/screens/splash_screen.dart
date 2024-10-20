import 'package:flutter/material.dart';
import 'package:nucleartension/states/splash_state.dart';
import 'package:nucleartension/utils/palette.dart';

class SplashScreen extends StatelessWidget {
  final SplashState state;

  const SplashScreen(this.state);

  factory SplashScreen.instance() => SplashScreen(SplashState());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Palette.iconLevel1,
        ),
      ),
    );
  }
}
