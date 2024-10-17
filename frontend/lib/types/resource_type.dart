import 'package:flutter/material.dart';
import 'package:nucleartension/types/research_type.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/palette.dart';

enum ResourceType {
  energy(
    sprite: Icons.bolt,
    color: Palette.resourceEnergy,
  ),
  population(
    sprite: Icons.people,
    color: Palette.resourcePopulation,
  );

  final IconData sprite;
  final Color color;

  const ResourceType({
    required this.sprite,
    required this.color,
  });

  Icon icon(double size) => Icon(
        sprite,
        color: color,
        size: size,
      );

  String get localized {
    switch (this) {
      case energy:
        return Localized.get.typeResourceEnergy;
      case population:
        return Localized.get.typeResourcePopulation;
    }
  }

  ResearchType get research {
    switch (this) {
      case energy:
        return ResearchType.resources_grid_management;
      case population:
        return ResearchType.resources_indoctrination;
    }
  }
}
