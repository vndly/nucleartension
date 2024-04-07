import 'package:nucleartension/extensions/item_map_extension.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
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
  ),

  // warning
  warning_missiles_radar_network(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  warning_missiles_hypersonic_propulsion(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  warning_military_early_warning(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  warning_military_fast_deployments(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),

  // military
  military_barracks_cost(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  military_barracks_time(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  military_factory_cost(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  military_factory_time(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  military_airfield_cost(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  military_airfield_time(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),

  // weapons
  weapons_fission_bomb(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  weapons_fusion_bomb(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),

  // resilience
  resilience_emergency_planning(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),

  // intel
  intel_economy_1(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  intel_economy_2(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  intel_military_1(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  intel_military_2(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  intel_technology_1(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  intel_technology_2(
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
      case warning_missiles_radar_network:
        return 'Radar Network';
      case warning_missiles_hypersonic_propulsion:
        return 'Hypersonic Propulsion';
      case warning_military_early_warning:
        return 'Early Warning';
      case warning_military_fast_deployments:
        return 'Fast Deployments';
      case military_barracks_cost:
        return 'Barracks Cost';
      case military_barracks_time:
        return 'Barracks Time';
      case military_factory_cost:
        return 'Factory Cost';
      case military_factory_time:
        return 'Factory Time';
      case military_airfield_cost:
        return 'Airfield Cost';
      case military_airfield_time:
        return 'Airfield Time';
      case weapons_fission_bomb:
        return 'Fission Bomb';
      case weapons_fusion_bomb:
        return 'Fusion Bomb';
      case resilience_emergency_planning:
        return 'Emergency Planning';
      case intel_economy_1:
        return 'Economy Level 1';
      case intel_economy_2:
        return 'Economy Level 2';
      case intel_military_1:
        return 'Military Level 1';
      case intel_military_2:
        return 'Military Level 2';
      case intel_technology_1:
        return 'Technology Level 1';
      case intel_technology_2:
        return 'Technology Level 2';
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
      case warning_missiles_radar_network:
        return '999';
      case warning_missiles_hypersonic_propulsion:
        return '1010';
      case warning_military_early_warning:
        return '1111';
      case warning_military_fast_deployments:
        return '1212';
      case military_barracks_cost:
        return '1313';
      case military_barracks_time:
        return '1414';
      case military_factory_cost:
        return '1515';
      case military_factory_time:
        return '1616';
      case military_airfield_cost:
        return '1717';
      case military_airfield_time:
        return '1818';
      case weapons_fission_bomb:
        return '1919';
      case weapons_fusion_bomb:
        return '2020';
      case resilience_emergency_planning:
        return '2121';
      case intel_economy_1:
        return '2222';
      case intel_economy_2:
        return '2323';
      case intel_military_1:
        return '2424';
      case intel_military_2:
        return '2525';
      case intel_technology_1:
        return '2626';
      case intel_technology_2:
        return '2727';
    }
  }
}
