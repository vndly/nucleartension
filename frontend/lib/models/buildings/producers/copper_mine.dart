import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/models/buildings/producers/producer.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/resource_type.dart';

class CopperMine extends Producer {
  CopperMine({
    required super.colony,
    required super.level,
    required super.villagers,
  }) : super(
          buildingType: BuildingType.copperMine,
          resourceType: ResourceType.copper,
          productionRate: Constants.COPPER_MINE_PRODUCTION_RATE,
        );
}
