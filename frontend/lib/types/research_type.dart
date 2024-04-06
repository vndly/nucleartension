import 'package:nucleartension/extensions/resource_map_extension.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/assets.dart';

enum ResearchType {
  energy(
    sprite: Assets.IMAGES_BUILDINGS_POWER_PLANT,
    initialCost: {
      ResourceType.technology: 20,
    },
  ),
  supplies(
    sprite: Assets.IMAGES_BUILDINGS_SUPPLY_CENTER,
    initialCost: {
      ResourceType.technology: 20,
    },
  ),
  population(
    sprite: Assets.IMAGES_BUILDINGS_PROPAGANDA_STATION,
    initialCost: {
      ResourceType.technology: 50,
    },
  ),
  technology(
    sprite: Assets.IMAGES_BUILDINGS_TECH_LAB,
    initialCost: {
      ResourceType.technology: 100,
    },
  );

  final String sprite;
  final ResourceMap initialCost;

  const ResearchType({
    required this.sprite,
    required this.initialCost,
  });

  ResourceMap cost(int level) => initialCost.multiply(level);

  String get localized {
    switch (this) {
      case energy:
        return 'Energy';
      case supplies:
        return 'Supplies';
      case population:
        return 'Population';
      case technology:
        return 'Technology';
    }
  }

  String get description {
    switch (this) {
      case energy:
        return '111';
      case supplies:
        return '222';
      case population:
        return '333';
      case technology:
        return '444';
    }
  }
}
