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
  final VoidCallback onMove;

  RegionLevel2PopulationComponent({
    required this.game,
    required this.region,
    required this.onUpgrade,
    required this.onMove,
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
      title: 'Upgrade (👤 ${region.costPropagandaUpgrade})',
      color: Palette.iconPopulation,
      onTap: onUpgrade,
      isEnabled: () => region.canUpgradePropaganda,
      position: Vector2(size.x * 0.3, size.y * 0.35),
    ));

    add(RegionButtonComponent(
      game: game,
      dimension: dimension,
      icon: '👣',
      title: 'Move',
      color: Palette.iconPopulation,
      onTap: onMove,
      isEnabled: () => false,
      position: Vector2(size.x * 0.3, size.y * 0.65),
    ));
  }
}
