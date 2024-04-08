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

  double get increaseRate => (researchType.rate * level) + 1;

  double get decreaseRate => 1 - (researchType.rate * level);
}
