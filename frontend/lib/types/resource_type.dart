import 'package:flutter/material.dart';
import 'package:nucleartension/utils/palette.dart';

enum ResourceType {
  energy(
    sprite: Icons.bolt,
    color: Palette.resourceEnergy,
  ),
  supplies(
    sprite: Icons.construction,
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

  @override
  String toString() => name.replaceAll('_', ' ');
}
