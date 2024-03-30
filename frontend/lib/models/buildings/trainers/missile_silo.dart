import 'package:nucleartension/models/buildings/trainers/trainer.dart';
import 'package:nucleartension/types/building_type.dart';

class MissileSilo extends Trainer {
  MissileSilo({
    required super.player,
    required super.level,
  }) : super(buildingType: BuildingType.missile_silo);
}
