import 'package:nucleartension/extensions/resource_map_extension.dart';
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
}
