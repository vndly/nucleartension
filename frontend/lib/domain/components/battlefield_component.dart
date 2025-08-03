import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/domain/components/region/region_component.dart';
import 'package:nucleartension/domain/models/battlefield.dart';
import 'package:nucleartension/domain/models/region.dart';

class BattlefieldComponent extends World {
  final Battlefield battlefield;

  BattlefieldComponent({required this.battlefield});

  @override
  Future onLoad() async {
    for (final Region region in battlefield.regions) {
      add(
        RegionComponent(
          region: region,
        ),
      );
    }

    add(
      FpsTextComponent(
        position: Vector2(-50, -50),
        textRenderer: TextPaint(
          style: const TextStyle(color: Colors.white, fontSize: 2),
        ),
      ),
    );
  }

  void unselectAllRegions() {
    /*for (final RegionComponent component
        in children.whereType<RegionComponent>()) {
      component.unselect();
    }*/
  }
}
