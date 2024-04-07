import 'package:nucleartension/extensions/item_map_extension.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/assets.dart';

enum ResearchType {
  // resources
  resources_grid_management(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 20,
    },
  ),
  resources_production_chain(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 20,
    },
  ),
  resources_indoctrination(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    initialCost: {
      ResourceType.technology: 50,
    },
  ),
  resources_quantum_computing(
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
      case resources_grid_management:
        return 'Grid Management';
      case resources_production_chain:
        return 'Production Chain';
      case resources_indoctrination:
        return 'Indoctrination';
      case resources_quantum_computing:
        return 'Quantum computing';
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
      case resources_grid_management:
        return 'Increases energy production by 10%';
      case resources_production_chain:
        return 'Increases supplies production by 10%';
      case resources_indoctrination:
        return 'Increases population production by 10%';
      case resources_quantum_computing:
        return 'Increases technology production by 10%';
      case missiles_additive_manufacturing:
        return 'Decreases missile cost production by 10%';
      case missiles_assembly_automation:
        return 'Decreases missile time production by 10%';
      case missiles_enhanced_guidance_systems:
        return 'Increases defense missiles effectiveness by 10%';
      case missiles_signal_jamming:
        return 'Decreases defense missiles effectiveness by 10%';
      case warning_missiles_radar_network:
        return 'Increases the warning time when receiving a missile attack by 10%';
      case warning_missiles_hypersonic_propulsion:
        return 'Decreases the warning time when launching a missile attack by 10%';
      case warning_military_early_warning:
        return 'Increases the warning time when receiving a military invasion by 10%';
      case warning_military_fast_deployments:
        return 'Decreases the warning time when launching a military invasion by 10%';
      case military_barracks_cost:
        return 'Decreases infantry cost production by 10%';
      case military_barracks_time:
        return 'Decreases infantry time production by 10%';
      case military_factory_cost:
        return 'Decreases vehicles cost production by 10%';
      case military_factory_time:
        return 'Decreases vehicles time production by 10%';
      case military_airfield_cost:
        return 'Decreases aircraft cost production by 10%';
      case military_airfield_time:
        return 'Decreases aircraft time production by 10%';
      case weapons_fission_bomb:
        return 'Increases fission bomb yield by 2x';
      case weapons_fusion_bomb:
        return 'Increases fusion bomb yield by 2x';
      case resilience_emergency_planning:
        return 'Decrease the amount of casualties by 10%';
      case intel_economy_1:
        return 'See ranking of economies among all players';
      case intel_economy_2:
        return 'See building levels of all players';
      case intel_military_1:
        return 'See ranking of military among all players';
      case intel_military_2:
        return 'See building levels of all players';
      case intel_technology_1:
        return 'See ranking of technologies among all players';
      case intel_technology_2:
        return 'See technologies levels of all players';
    }
  }
}
