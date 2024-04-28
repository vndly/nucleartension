import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/states/game_state.dart';
import 'package:nucleartension/utils/environment.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/views/events_view.dart';
import 'package:nucleartension/views/map_view.dart';
import 'package:nucleartension/views/military_view.dart';
import 'package:nucleartension/views/research_view.dart';
import 'package:nucleartension/views/resources_view.dart';
import 'package:nucleartension/views/war_room_view.dart';
import 'package:nucleartension/widgets/blocks/header_block.dart';
import 'package:nucleartension/widgets/blocks/warning_block.dart';
import 'package:nucleartension/widgets/labels/label.dart';
import 'package:nucleartension/widgets/misc/game_container.dart';
import 'package:nucleartension/widgets/misc/game_loop.dart';
import 'package:nucleartension/widgets/separators/block_separator.dart';

class GameScreen extends StatelessWidget {
  final GameState state;

  const GameScreen(this.state);

  factory GameScreen.instance() => GameScreen(GameState());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: state.finished,
      onPopInvoked: (popped) => state.onPause(),
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
          items: [
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(Icons.radar),
              ),
              label: Localized.get.bottomBarWarRoom.toUpperCase(),
            ),
            BottomNavigationBarItem(
              icon: Badge(
                largeSize: widget.state.game.hasUnseenEvents ? 20 : 0,
                label: Label(
                  text: widget.state.game.unseenEvents.length.toString(),
                  size: 15,
                  color: Palette.textPrimary,
                ),
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Icon(Icons.format_list_bulleted),
                ),
              ),
              label: Localized.get.bottomBarEvents.toUpperCase(),
            ),
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(Icons.widgets),
              ),
              label: Localized.get.bottomBarResources.toUpperCase(),
            ),
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(Icons.military_tech_outlined),
              ),
              label: Localized.get.bottomBarMilitary.toUpperCase(),
            ),
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(Icons.science),
              ),
              label: Localized.get.bottomBarResearch.toUpperCase(),
            ),
            if (Environment.isDebug)
              const BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Icon(Icons.language),
                ),
                label: 'MAP',
              ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Palette.backgroundScreen,
        child: Column(
          children: [
            WarningBlock(widget.state.game),
            HeaderBlock(widget.state.game.self),
            const BlockSeparator(),
            Expanded(child: _body(currentIndex)),
          ],
        ),
      ),
    );
  }

  Widget _body(int index) {
    if (currentIndex == 0) {
      return WarRoomView(widget.state.game);
    } else if (currentIndex == 1) {
      return EventsView(widget.state.game);
    } else if (currentIndex == 2) {
      return ResourcesView(widget.state.game);
    } else if (currentIndex == 3) {
      return MilitaryView(widget.state.game);
    } else if (currentIndex == 4) {
      return ResearchView(widget.state.game);
    } else if (currentIndex == 5) {
      return MapView(widget.state.game);
    } else {
      return const Empty();
    }
  }
}
