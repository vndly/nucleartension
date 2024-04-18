import 'package:flutter/material.dart';
import 'package:nucleartension/states/home_state.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/buttons/primary_button.dart';
import 'package:nucleartension/widgets/misc/game_container.dart';

class HomeScreen extends StatelessWidget {
  final HomeState state;

  const HomeScreen(this.state);

  factory HomeScreen.instance() => HomeScreen(HomeState());

  @override
  Widget build(BuildContext context) {
    return const GameContainer(
      child: Center(
        child: CircularProgressIndicator(
          color: Palette.loader,
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  final HomeState state;

  const Content(this.state);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Palette.backgroundScreen,
        borderRadius: BorderRadius.circular(5),
      ),
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButton(
              text: 'Continue',
              icon: Icons.play_arrow,
              color: Palette.textPrimary,
              onPressed: state.onContinue,
            ),
            PrimaryButton(
              text: 'Settings',
              icon: Icons.settings,
              color: Palette.textPrimary,
              onPressed: state.onSettings,
            ),
            PrimaryButton(
              text: 'Info',
              icon: Icons.info,
              color: Palette.textPrimary,
              onPressed: state.onInfo,
            ),
          ],
        ),
      ),
    );
  }
}
