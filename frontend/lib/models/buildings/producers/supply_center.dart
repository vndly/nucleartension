import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/models/buildings/producers/producer.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/resource_type.dart';

class SupplyCenter extends Producer {
  SupplyCenter({
    required super.base,
    required super.level,
  }) : super(
          buildingType: BuildingType.supply_center,
          resourceType: ResourceType.supplies,
          productionRate: Constants.SUPPLY_CENTER_PRODUCTION_RATE,
        );
}
