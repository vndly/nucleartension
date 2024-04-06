import 'package:nucleartension/extensions/resource_map_extension.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/assets.dart';

enum ResearchType {
  // resources
  resources_energy(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 20,
    },
  ),
  resources_supplies(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 20,
    },
  ),
  resources_population(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 50,
    },
  ),
  resources_technology(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),

  // missiles
  missiles_additive_manufacturing(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  missiles_assembly_automation(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  missiles_enhanced_guidance_systems(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  missiles_signal_jamming(
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
      case resources_energy:
        return 'Energy';
      case resources_supplies:
        return 'Supplies';
      case resources_population:
        return 'Population';
      case resources_technology:
        return 'Technology';
      case missiles_additive_manufacturing:
        return 'Additive Manufacturing';
      case missiles_assembly_automation:
        return 'Assembly Automation';
      case missiles_enhanced_guidance_systems:
        return 'Enhanced Guidance Systems';
      case missiles_signal_jamming:
        return 'Signal Jamming';
    }
  }

  String get description {
    switch (this) {
      case resources_energy:
        return '111';
      case resources_supplies:
        return '222';
      case resources_population:
        return '333';
      case resources_technology:
        return '444';
      case missiles_additive_manufacturing:
        return '555';
      case missiles_assembly_automation:
        return '666';
      case missiles_enhanced_guidance_systems:
        return '777';
      case missiles_signal_jamming:
        return '888';
    }
  }
}
