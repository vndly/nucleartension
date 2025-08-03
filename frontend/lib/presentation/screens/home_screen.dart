import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/domain/states/home_state.dart';
import 'package:nucleartension/presentation/widgets/buttons/primary_button.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/palette.dart';

class HomeScreen extends StatelessWidget {
  final HomeState state;

  const HomeScreen(this.state);

  factory HomeScreen.instance() => HomeScreen(HomeState());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator(color: Palette.iconLevel1)),
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
