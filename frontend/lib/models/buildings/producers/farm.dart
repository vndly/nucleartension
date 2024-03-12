import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/models/buildings/producers/producer.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/resource_type.dart';

class Farm extends Producer {
  Farm({
    required super.colony,
    required super.level,
    required super.villagers,
  }) : super(
          buildingType: BuildingType.farm,
          resourceType: ResourceType.food,
          productionRate: Constants.FARM_PRODUCTION_RATE,
        );
}
