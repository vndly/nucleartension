import 'dart:async';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/components/region/region_button_component.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/region.dart';
import 'package:nucleartension/utils/palette.dart';

class RegionLevel2MissilesComponent extends PositionComponent {
  final Game game;
  final Region region;
  final VoidCallback onUpgrade;
  final VoidCallback onBuildDefense;
  final VoidCallback onBuildAttack;

  RegionLevel2MissilesComponent({
    required this.game,
    required this.region,
    required this.onUpgrade,
    required this.onBuildDefense,
    required this.onBuildAttack,
    required super.size,
  });

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
      position: Vector2(size.x * 0.3, size.y * 0.25),
    ));

    add(RegionButtonComponent(
      game: game,
      dimension: dimension,
      icon: '🛡️',
      title: 'Build defense',
      color: Palette.iconMissiles,
      onTap: onBuildDefense,
      position: Vector2(size.x * 0.3, size.y * 0.50),
    ));

    add(RegionButtonComponent(
      game: game,
      dimension: dimension,
      icon: '💣',
      title: 'Build attack',
      color: Palette.iconMissiles,
      onTap: onBuildDefense,
      position: Vector2(size.x * 0.3, size.y * 0.75),
    ));
  }
}
