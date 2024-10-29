import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/components/region/region_first_level.dart';
import 'package:nucleartension/components/region/region_neutral.dart';
import 'package:nucleartension/components/region/region_own.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/region.dart';

class RegionComponent extends PositionComponent
    with TapCallbacks, GestureHitboxes {
  final Game game;
  final Region region;
  final Paint paintBorder = Paint();
  final Paint paintFill = Paint();
  Component? overlayComponent;
  MenuState menuState = MenuState.hidden;

  RegionComponent({
    required this.game,
    required this.region,
    required super.position,
    required super.size,
  }) : super(anchor: Anchor.center) {
    paintBorder.style = PaintingStyle.stroke;
    paintBorder.strokeWidth = 0.5;

    paintFill.style = PaintingStyle.fill;
  }

  @override
  Future onLoad() async {
    super.onLoad();
    add(CircleHitbox());

    if (region.isNeutral) {
      add(RegionNeutralComponent(
        game: game,
        region: region,
        size: size,
      ));
    } else if (region.belongsTo(game.self)) {
      add(RegionOwnComponent(
        game: game,
        region: region,
        size: size,
      ));
    }
  }

  @override
  void onTapUp(TapUpEvent event) {
    //game.onNeutralRegionSelected(region);

    overlayComponent?.removeFromParent();

    if (menuState == MenuState.hidden) {
      menuState = MenuState.first_level;
    } else {
      menuState = MenuState.hidden;
    }

    if (menuState == MenuState.first_level) {
      overlayComponent = RegionFirstLevelComponent(
        game: game,
        region: region,
        size: size,
      );
      add(overlayComponent!);
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    _painBackground(canvas);
  }

  void _painBackground(Canvas canvas) {
    paintBorder.color = region.color;
    paintFill.color = region.color.withAlpha(75);

    if (region.selected) {
      canvas.drawPath(_path, paintFill);
    }

    canvas.drawPath(_path, paintBorder);
  }

  List<Vector2> get _points {
    const double ratio = 0.57;
    final List<Vector2> result = [];

    for (int i = 0; i < 6; i++) {
      final double angle = i * 2 * pi / 6;
      final double x = size.x / 2 + size.x * ratio * cos(angle);
      final double y = size.y / 2 + size.y * ratio * sin(angle);

      result.add(Vector2(x, y));
    }

    return result;
  }

  Path get _path {
    final Path result = Path();
    final List<Vector2> points = _points;
    result.moveTo(points[0].x, points[0].y);

    for (int i = 1; i < points.length; i++) {
      result.lineTo(points[i].x, points[i].y);
    }

    result.close();

    return result;
  }
}

enum MenuState {
  hidden,
  first_level,
}
