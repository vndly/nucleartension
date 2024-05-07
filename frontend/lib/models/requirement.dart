import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/building_type.dart';

class Requirement<T> {
  final T? type;

  const Requirement(this.type);

  bool fulfilled(Player player) {
    if (type != null) {
      if (type is BuildingType) {
        final Building building = player.getBuilding(type as BuildingType);

        return building.level > 0;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }
}
