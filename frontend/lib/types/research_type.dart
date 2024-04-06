import 'package:nucleartension/extensions/resource_map_extension.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/assets.dart';

enum ResearchType {
  // resources
  energy(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 20,
    },
  ),
  supplies(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 20,
    },
  ),
  population(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 50,
    },
  ),
  technology(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),

  // missiles
  additive_manufacturing(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  assembly_automation(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  enhanced_guidance_systems(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  signal_jamming(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
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
      case additive_manufacturing:
        return 'Additive Manufacturing';
      case assembly_automation:
        return 'Assembly Automation';
      case enhanced_guidance_systems:
        return 'Enhanced Guidance Systems';
      case signal_jamming:
        return 'Signal Jamming';
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
      case additive_manufacturing:
        return '555';
      case assembly_automation:
        return '666';
      case enhanced_guidance_systems:
        return '777';
      case signal_jamming:
        return '888';
    }
  }
}
