import 'dart:math';
import 'package:nucleartension/extensions/item_map_extension.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/upgradable.dart';
import 'package:nucleartension/types/building_type.dart';
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

  @override
  bool get canUpgrade => requirementFulfilled && super.canUpgrade;

  @override
  num get upgradeTime => upgradeCost.duration;

  @override
  bool get isMax => level >= researchType.maxLevel;

  bool get requirementFulfilled => researchType.requirement.fulfilled(player);

  BuildingType get requirementType => researchType.requirement.type!;

  int get requirementMinLevel => researchType.requirement.minLevel;

  double get rate => researchType.rate * level;

  double get increaseRate => 1 + rate;

  double get decreaseRate => 1 - rate;

  void autoResearch() {
    if (!isMax) {
      level++;
    }
  }

  // In kt
  static int yield(int level) {
    if (level <= 7) {
      return (pow(2, level - 1) * 10).toInt();
    } else {
      return (pow(2, level - 8) * 1000).toInt();
    }
  }
}
