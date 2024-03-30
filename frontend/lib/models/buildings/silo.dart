import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/types/building_type.dart';

class MissileSilo extends Building {
  int currentCapacity = 0;

  MissileSilo({
    required super.player,
    required super.level,
  }) : super(buildingType: BuildingType.missile_silo);

  int get maxCapacity => level * 10;
}
