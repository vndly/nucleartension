import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/models/buildings/producers/producer.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/resource_type.dart';

class PropagandaStation extends Producer {
  PropagandaStation({
    required super.game,
    required super.level,
  }) : super(
          buildingType: BuildingType.propaganda_station,
          resourceType: ResourceType.population,
          productionRate: Constants.PROPAGANDA_STATION_PRODUCTION_RATE,
        );
}
