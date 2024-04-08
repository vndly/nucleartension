import 'dart:math';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/upgradable.dart';
import 'package:nucleartension/types/research_type.dart';

class Research extends Upgradable {
  final ResearchType researchType;

  Research({
    required super.player,
    required super.level,
    required this.researchType,
  });

  @override
  ResourceMap get upgradeCost => researchType.cost(level + 1);

  bool get isMax => level >= researchType.maxLevel;

  double get rate => researchType.rate * level;

  double get increaseRate => rate + 1;

  double get decreaseRate => 1 - rate;

  // In kt
  static int yield(int level) {
    if (level <= 7) {
      return (pow(2, level - 1) * 10).toInt();
    } else {
      return (pow(2, level - 8) * 1000).toInt();
    }
  }
}
