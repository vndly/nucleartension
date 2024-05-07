import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/research_type.dart';

class Requirement<T> {
  final T? type;
  final int minLevel;

  const Requirement({
    this.type,
    this.minLevel = 0,
  });

  bool fulfilled(Player player) {
    if (type != null) {
      if (type is BuildingType) {
        final Building building = player.getBuilding(type as BuildingType);

        return building.level >= minLevel;
      } else if (type is ResearchType) {
        final Research research = player.getResearch(type as ResearchType);

        return research.level >= minLevel;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }
}
