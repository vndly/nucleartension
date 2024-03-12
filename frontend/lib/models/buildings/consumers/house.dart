import 'package:nucleartension/extensions/resource_map_extension.dart';
import 'package:nucleartension/models/buildings/consumers/consumer.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/types/unit_type.dart';

class House extends Consumer {
  House({
    required super.colony,
    required super.level,
  }) : super(
          buildingType: BuildingType.house,
          unitType: UnitType.villager,
        );

  @override
  ResourceMap get trainingCost => {
        ResourceType.food: 50,
      };

  @override
  void train() {}
}
