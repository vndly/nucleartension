import 'package:flutter/material.dart';

enum ResourceType {
  energy(icon: Icons.bolt),
  supplies(icon: Icons.construction),
  population(icon: Icons.people),
  technology(icon: Icons.science);

  final IconData icon;

  const ResourceType({
    required this.icon,
  });

  @override
  String toString() => name.replaceAll('_', ' ');
}
