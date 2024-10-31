import 'dart:async';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/components/region/region_button_component.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/region.dart';
import 'package:nucleartension/utils/palette.dart';

class RegionLevel2ResearchComponent extends PositionComponent {
  final Game game;
  final Region region;
  final VoidCallback onResearch1;
  final VoidCallback onResearch2;
  final VoidCallback onResearch3;

  RegionLevel2ResearchComponent({
    required this.game,
    required this.region,
    required this.onResearch1,
    required this.onResearch2,
    required this.onResearch3,
    required super.size,
  });

  @override
  Future onLoad() async {
    super.onLoad();

    final double dimension = size.x / 12;

    add(RegionButtonComponent(
      game: game,
      dimension: dimension,
      icon: '🧪',
      title: 'Research 1',
      color: Palette.iconResearch,
      onTap: onResearch1,
      position: Vector2(size.x * 0.3, size.y * 0.25),
    ));

    add(RegionButtonComponent(
      game: game,
      dimension: dimension,
      icon: '🧪',
      title: 'Research 2',
      color: Palette.iconResearch,
      onTap: onResearch2,
      position: Vector2(size.x * 0.3, size.y * 0.50),
    ));

    add(RegionButtonComponent(
      game: game,
      dimension: dimension,
      icon: '🧪',
      title: 'Research 3',
      color: Palette.iconResearch,
      onTap: onResearch2,
      position: Vector2(size.x * 0.3, size.y * 0.75),
    ));
  }
}
