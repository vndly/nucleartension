import 'package:nucleartension/models/buildings/producers/producer.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/resource_type.dart';

class TechLab extends Producer {
  TechLab({
    required super.player,
    required super.level,
  }) : super(
          buildingType: BuildingType.tech_lab,
          resourceType: ResourceType.technology,
        );
}
