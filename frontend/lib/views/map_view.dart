import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class MapView extends StatelessWidget {
  final Game game;

  const MapView(this.game);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Label(text: 'MAP'),
    );
  }
}
