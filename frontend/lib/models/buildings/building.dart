import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/upgradable.dart';
import 'package:nucleartension/types/building_type.dart';

class Building extends Upgradable {
  final BuildingType buildingType;

  Building({
    required super.player,
    required super.level,
    required this.buildingType,
  });

  @override
  ResourceMap get upgradeCost => buildingType.cost(level + 1);
}
