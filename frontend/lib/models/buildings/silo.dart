import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/types/building_type.dart';

class MissileSilo extends Building {
  MissileSilo({
    required super.game,
    required super.level,
  }) : super(buildingType: BuildingType.missile_silo);
}
