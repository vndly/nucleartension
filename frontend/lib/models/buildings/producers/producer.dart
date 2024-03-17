import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/types/resource_type.dart';

abstract class Producer extends Building {
  final ResourceType resourceType;
  final double productionRate;

  Producer({
    required this.resourceType,
    required this.productionRate,
    required super.buildingType,
    required super.game,
    required super.level,
  });

  double get production => productionRate * game.defconProductionBoost * level;

  @override
  bool get isProducer => true;

  @override
  void update(double dt) {
    super.update(dt);

    final double produced = production * dt;
    game.resourceInventory.add(resourceType, produced);
  }
}
