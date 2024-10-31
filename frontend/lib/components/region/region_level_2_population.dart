import 'dart:async';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/components/region/region_button_component.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/region.dart';
import 'package:nucleartension/utils/palette.dart';

class RegionLevel2PopulationComponent extends PositionComponent {
  final Game game;
  final Region region;
  final VoidCallback onUpgrade;
  final Paint paint = Paint();

  RegionLevel2PopulationComponent({
    required this.game,
    required this.region,
    required this.onUpgrade,
    required super.size,
  }) {
    paint.color = Colors.red;
  }

  @override
  Future onLoad() async {
    super.onLoad();

    final double dimension = size.x / 12;

    add(RegionButtonComponent(
      game: game,
      dimension: dimension,
      icon: '⬆️',
      title: 'Upgrade',
      color: Palette.iconPopulation,
      onTap: onUpgrade,
      position: Vector2(size.x * 0.3, size.y * 0.35),
    ));

    add(RegionButtonComponent(
      game: game,
      dimension: dimension,
      icon: '👣',
      title: 'Move',
      color: Palette.iconMissiles,
      onTap: onUpgrade,
      position: Vector2(size.x * 0.3, size.y * 0.65),
    ));
  }
}
