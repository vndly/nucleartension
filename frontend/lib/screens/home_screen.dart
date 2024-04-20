import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/states/home_state.dart';
import 'package:nucleartension/utils/localizations.dart';
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
      child: Empty(),
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
      child: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PrimaryButton(
                text: Localized.get.homeContinue,
                icon: Icons.play_arrow,
                color: Palette.buttonEnabled,
                onPressed: state.onContinue,
                expand: true,
              ),
              const VBox(20),
              PrimaryButton(
                text: Localized.get.homeSettings,
                icon: Icons.settings,
                color: Palette.buttonEnabled,
                onPressed: state.onSettings,
                expand: true,
              ),
              const VBox(20),
              PrimaryButton(
                text: Localized.get.homeInfo,
                icon: Icons.info,
                color: Palette.buttonEnabled,
                onPressed: state.onInfo,
                expand: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
