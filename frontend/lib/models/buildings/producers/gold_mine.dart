import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/models/buildings/producers/producer.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/resource_type.dart';

class GoldMine extends Producer {
  GoldMine({
    required super.colony,
    required super.level,
    required super.villagers,
  }) : super(
          buildingType: BuildingType.goldMine,
          resourceType: ResourceType.gold,
          productionRate: Constants.GOLD_MINE_PRODUCTION_RATE,
        );
}
