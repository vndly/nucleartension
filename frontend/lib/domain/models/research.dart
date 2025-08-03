import 'dart:math';
import 'package:nucleartension/domain/models/upgradable.dart';
import 'package:nucleartension/domain/types/research_type.dart';

class Research extends Upgradable {
  final ResearchType researchType;

  Research({
    required super.player,
    required super.level,
    required this.researchType,
  });

  @override
  int get upgradeCost => researchType.cost(level + 1);

  @override
  num get upgradeTime => upgradeCost * 1;

  @override
  bool get isMax => level >= researchType.maxLevel;

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
