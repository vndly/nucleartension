import 'package:nucleartension/models/buildings/producers/producer.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/resource_type.dart';

class PowerPlant extends Producer {
  PowerPlant({
    required super.player,
    required super.level,
  }) : super(
          buildingType: BuildingType.power_plant,
          resourceType: ResourceType.energy,
        );
}
