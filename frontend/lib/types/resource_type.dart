import 'package:flutter/material.dart';
import 'package:nucleartension/types/research_type.dart';
import 'package:nucleartension/utils/palette.dart';

enum ResourceType {
  energy(
    sprite: Icons.bolt,
    color: Palette.resourceEnergy,
  ),
  supplies(
    sprite: Icons.token,
    color: Palette.resourceSupplies,
  ),
  population(
    sprite: Icons.people,
    color: Palette.resourcePopulation,
  ),
  technology(
    sprite: Icons.science,
    color: Palette.resourceTechnology,
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

  // TODO(momo): localize
  String get localized {
    switch (this) {
      case energy:
        return 'Energy';
      case supplies:
        return 'Supplies';
      case population:
        return 'Population';
      case technology:
        return 'Technology';
    }
  }

  ResearchType get research {
    switch (this) {
      case energy:
        return ResearchType.resources_grid_management;
      case supplies:
        return ResearchType.resources_production_chain;
      case population:
        return ResearchType.resources_indoctrination;
      case technology:
        return ResearchType.resources_quantum_computing;
    }
  }
}
