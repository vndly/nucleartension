import 'dart:async';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/components/region/region_button_component.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/region.dart';
import 'package:nucleartension/utils/palette.dart';

class RegionLevel1Component extends PositionComponent {
  final Game game;
  final Region region;
  final VoidCallback onPopulation;
  final VoidCallback onMissiles;
  final VoidCallback onResearch;
  final Paint paint = Paint();

  RegionLevel1Component({
    required this.game,
    required this.region,
    required this.onPopulation,
    required this.onMissiles,
    required this.onResearch,
    required super.size,
  }) {
    paint.color = Colors.red;
  }

  @override
  Future onLoad() async {
    super.onLoad();

    final double dimension = size.x / 12;

    add(
      RegionButtonComponent(
        game: game,
        dimension: dimension,
        icon: '👤',
        title: 'Population',
        color: Palette.iconPopulation,
        onTap: onPopulation,
        isEnabled: () => true,
        position: Vector2(size.x * 0.3, size.y * 0.25),
      ),
    );

    add(
      RegionButtonComponent(
        game: game,
        dimension: dimension,
        icon: '🚀',
        title: 'Missiles',
        color: Palette.iconMissiles,
        onTap: onMissiles,
        isEnabled: () => true,
        position: Vector2(size.x * 0.3, size.y * 0.50),
      ),
    );

    add(
      RegionButtonComponent(
        game: game,
        dimension: dimension,
        icon: '💡',
        title: 'Research',
        color: Palette.iconResearch,
        onTap: onResearch,
        isEnabled: () => true,
        position: Vector2(size.x * 0.3, size.y * 0.75),
      ),
    );
  }
}
