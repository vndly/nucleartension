import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/states/game_state.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/hud/map_view.dart';
import 'package:nucleartension/widgets/hud/top_menu.dart';
import 'package:nucleartension/widgets/labels/label.dart';
import 'package:nucleartension/widgets/misc/game_loop.dart';

class GameScreen extends StatelessWidget {
  final GameState state;

  const GameScreen(this.state);

  factory GameScreen.instance() => GameScreen(GameState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: state.finished,
        onPopInvokedWithResult: (didPop, result) => state.onPause(),
        child: GameLoop(state),
      ),
    );
  }
}

class GameContent extends StatelessWidget {
  final GameState state;

  const GameContent(this.state);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: state.unselectRegion,
      child: Container(
        color: Palette.transparent,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: MapView(state),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: TopMenu(state.game),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Label(text: 'FPS: ${state.game.fps.fps()}'),
              ),
            ),
            if (state.hasSelectedRegion) RegionMenu(state),
          ],
        ),
      ),
    );
  }
}

class RegionMenu extends StatelessWidget {
  final GameState state;

  const RegionMenu(this.state);

  @override
  Widget build(BuildContext context) {
    const double size = 200;
    const double buttonSize = size / 2.5;

    return Positioned(
      top: state.selectedRegionPosition!.y - (size / 2),
      left: state.selectedRegionPosition!.x - (size / 2),
      child: const SizedBox(
        width: size,
        height: size,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: RegionMenuButton(
                size: buttonSize,
                icon: Icons.bolt,
                label: '2',
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: RegionMenuButton(
                size: buttonSize,
                icon: Icons.radio_button_checked_outlined,
                label: '3',
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: RegionMenuButton(
                size: buttonSize,
                icon: Icons.shield,
                label: '4',
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: RegionMenuButton(
                size: buttonSize,
                icon: Icons.sunny,
                label: '5',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegionMenuButton extends StatelessWidget {
  final double size;
  final IconData icon;
  final String label;

  const RegionMenuButton({
    required this.size,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: size / 30,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: size / 2.5,
              color: Colors.white,
            ),
            const VBox(5),
            Label(
              text: label,
              color: Colors.white,
              size: size / 4,
              weight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
