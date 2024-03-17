import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/types/building_type.dart';

class Silo extends Building {
  Silo({
    required super.game,
    required super.level,
  }) : super(buildingType: BuildingType.silo);
}
