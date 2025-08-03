import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/components/region/region_level_0.dart';
import 'package:nucleartension/components/region/region_level_1.dart';
import 'package:nucleartension/components/region/region_level_2_missiles.dart';
import 'package:nucleartension/components/region/region_level_2_population.dart';
import 'package:nucleartension/components/region/region_level_2_research.dart';
import 'package:nucleartension/components/region/region_neutral.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/region.dart';

class RegionComponent extends PositionComponent
    with TapCallbacks, GestureHitboxes {
  final Game game;
  final Region region;
  late final Paint paintBorder;
  late final Paint paintFill;
  Component? overlayComponent;
  MenuState menuState = MenuState.level_0;

  RegionComponent({
    required this.game,
    required this.region,
    required super.position,
    required super.size,
  }) : super(anchor: Anchor.center) {
    paintBorder = normalPaint(
      color: region.color,
      strokeWidth: 0.5,
      style: PaintingStyle.stroke,
    );

    paintFill = normalPaint(
      color: region.color.withAlpha(75),
      strokeWidth: 0.5,
      style: PaintingStyle.fill,
    );
  }

  @override
  Future onLoad() async {
    super.onLoad();
    add(CircleHitbox());

    if (region.isNeutral) {
      add(RegionNeutralComponent(game: game, region: region, size: size));
    } else if (region.belongsTo(game.self)) {
      overlayComponent = RegionLevel0Component(
        game: game,
        region: region,
        size: size,
      );
      add(overlayComponent!);
    }
  }

  void unselect() {
    menuState = MenuState.level_0;
    overlayComponent?.removeFromParent();
  }

  @override
  void onTapUp(TapUpEvent event) {
    //game.onNeutralRegionSelected(region);

    if (region.belongsTo(game.self)) {
      if (menuState == MenuState.level_0) {
        menuState = MenuState.level_1;
      } else {
        menuState = MenuState.level_0;
      }

      _onMenuUpdated();
    } else {
      game.unselectAllRegions();
    }
  }

  void _onMenuUpdated() {
    overlayComponent?.removeFromParent();

    switch (menuState) {
      case MenuState.level_0:
        overlayComponent = RegionLevel0Component(
          game: game,
          region: region,
          size: size,
        );
        break;
      case MenuState.level_1:
        overlayComponent = RegionLevel1Component(
          game: game,
          region: region,
          size: size,
          onPopulation: _onPopulationSelected,
          onMissiles: _onMissilesSelected,
          onResearch: _onResearchSelected,
        );
        break;
      case MenuState.level_2_population:
        overlayComponent = RegionLevel2PopulationComponent(
          game: game,
          region: region,
          size: size,
          onUpgrade: _onPopulationUpgrade,
          onMove: _onPopulationMove,
        );
        break;
      case MenuState.level_2_missiles:
        overlayComponent = RegionLevel2MissilesComponent(
          game: game,
          region: region,
          size: size,
          onUpgrade: _onMissilesUpgrade,
          onBuildDefense: _onMissilesBuildDefense,
          onBuildAttack: _onMissilesBuildAttack,
        );
        break;
      case MenuState.level_2_research:
        overlayComponent = RegionLevel2ResearchComponent(
          game: game,
          region: region,
          size: size,
          onResearch1: _onResearch1,
          onResearch2: _onResearch2,
          onResearch3: _onResearch3,
        );
        break;
    }

    add(overlayComponent!);
  }

  void _onPopulationSelected() {
    menuState = MenuState.level_2_population;
    _onMenuUpdated();
  }

  void _onMissilesSelected() {
    menuState = MenuState.level_2_missiles;
    _onMenuUpdated();
  }

  void _onResearchSelected() {
    menuState = MenuState.level_2_research;
    _onMenuUpdated();
  }

  void _onPopulationUpgrade() {
    menuState = MenuState.level_0;
    region.upgradePropaganda();
    _onMenuUpdated();
  }

  void _onPopulationMove() {
    menuState = MenuState.level_0;
    _onMenuUpdated();
  }

  void _onMissilesUpgrade() {
    menuState = MenuState.level_0;
    _onMenuUpdated();
  }

  void _onMissilesBuildDefense() {
    menuState = MenuState.level_0;
    _onMenuUpdated();
  }

  void _onMissilesBuildAttack() {
    menuState = MenuState.level_0;
    _onMenuUpdated();
  }

  void _onResearch1() {
    menuState = MenuState.level_0;
    _onMenuUpdated();
  }

  void _onResearch2() {
    menuState = MenuState.level_0;
    _onMenuUpdated();
  }

  void _onResearch3() {
    menuState = MenuState.level_0;
    _onMenuUpdated();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    _painBackground(canvas);
  }

  void _painBackground(Canvas canvas) {
    if (menuState != MenuState.level_0) {
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

  static Paint normalPaint({
    required Color color,
    required double strokeWidth,
    PaintingStyle style = PaintingStyle.stroke,
  }) {
    final Paint paint = Paint();
    paint.style = style;
    paint.isAntiAlias = true;
    paint.color = color;
    paint.strokeWidth = strokeWidth;

    return paint;
  }
}

enum MenuState {
  level_0,
  level_1,
  level_2_population,
  level_2_missiles,
  level_2_research,
}
