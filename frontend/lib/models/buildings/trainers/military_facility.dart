import 'package:nucleartension/models/buildings/trainers/trainer.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/unit_type.dart';

class MilitaryFacility extends Trainer {
  MilitaryFacility({
    required super.player,
    required super.level,
  }) : super(buildingType: BuildingType.military_facility);

  @override
  void addUnitToQueue(UnitType unitType) {}

  @override
  int get queueSize => throw UnimplementedError();
}
