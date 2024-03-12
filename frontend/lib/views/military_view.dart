import 'package:flutter/material.dart';
import 'package:nucleartension/states/game_state.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class MilitaryView extends StatelessWidget {
  final GameState state;

  const MilitaryView(this.state);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Label(
        text: 'MILITARY',
        color: Palette.text,
      ),
    );
  }
}
