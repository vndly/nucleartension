import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/states/game_state.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/views/military_view.dart';
import 'package:nucleartension/views/research_view.dart';
import 'package:nucleartension/views/resources_view.dart';
import 'package:nucleartension/views/war_room_view.dart';
import 'package:nucleartension/widgets/misc/game_container.dart';
import 'package:nucleartension/widgets/misc/game_loop.dart';

class GameScreen extends StatelessWidget {
  final GameState state;

  const GameScreen(this.state);

  factory GameScreen.instance() => GameScreen(GameState());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GameContainer(
        child: GameLoop(state),
      ),
    );
  }
}

class GameContent extends StatefulWidget {
  final GameState state;

  const GameContent(this.state);

  @override
  State<GameContent> createState() => _GameContentState();
}

class _GameContentState extends State<GameContent> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Palette.borderSeparator,
              width: 0.5,
            ),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          selectedItemColor: Palette.menuSelected,
          unselectedItemColor: Palette.menuUnselected,
          backgroundColor: Palette.backgroundScreen,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(Icons.radar),
              ),
              label: 'WAR ROOM',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(Icons.widgets),
              ),
              label: 'RESOURCES',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(Icons.military_tech_outlined),
              ),
              label: 'MILITARY',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(Icons.science),
              ),
              label: 'RESEARCH',
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Palette.backgroundScreen,
        child: _body(currentIndex),
      ),
    );
  }

  Widget _body(int index) {
    if (currentIndex == 0) {
      return WarRoomView(widget.state.game);
    } else if (currentIndex == 1) {
      return ResourcesView(widget.state.game);
    } else if (currentIndex == 2) {
      return MilitaryView(widget.state.game);
    } else if (currentIndex == 3) {
      return ResearchView(widget.state.game);
    } else {
      return const Empty();
    }
  }
}
