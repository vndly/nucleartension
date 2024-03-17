import 'package:nucleartension/models/buildings/building.dart';
import 'package:nucleartension/types/resource_type.dart';

abstract class Producer extends Building {
  final ResourceType resourceType;
  final double productionRate;

  Producer({
    required this.resourceType,
    required this.productionRate,
    required super.buildingType,
    required super.base,
    required super.level,
  });

  double get production => productionRate * level;

  @override
  bool get isProducer => true;

  @override
  void update(double dt) {
    super.update(dt);

    final double produced = production * dt;
    base.resourceInventory.add(resourceType, produced);
  }
}
