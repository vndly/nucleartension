import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/types/resource_type.dart';

abstract class Producer extends Building {
  final ResourceType resourceType;

  Producer({
    required this.resourceType,
    required super.buildingType,
    required super.player,
    required super.level,
  });

  double get productionRate => Constants.PRODUCTION_RATE[buildingType]!;

  double get production =>
      productionRate * player.defconProductionBoost * level;

  @override
  void update(double dt) {
    super.update(dt);

    final double produced = production * dt;
    player.resources.add(resourceType, produced);
  }
}
