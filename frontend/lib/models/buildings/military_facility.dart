import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/types/building_type.dart';

class MilitaryFacility extends Building {
  MilitaryFacility({
    required super.player,
    required super.level,
  }) : super(buildingType: BuildingType.military_facility);
}
