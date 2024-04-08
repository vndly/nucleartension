import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/extensions/item_map_extension.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/assets.dart';
import 'package:nucleartension/utils/formatter.dart';

enum ResearchType {
  // resources
  resources_grid_management(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 10,
    initialCost: {
      ResourceType.technology: 20,
    },
  ),
  resources_production_chain(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 10,
    initialCost: {
      ResourceType.technology: 20,
    },
  ),
  resources_indoctrination(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 10,
    initialCost: {
      ResourceType.technology: 50,
    },
  ),
  resources_quantum_computing(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 10,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),

  // missiles
  missiles_additive_manufacturing(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  missiles_assembly_automation(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  missiles_enhanced_guidance_systems(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  missiles_signal_jamming(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),

  // warning
  warning_missiles_radar_network(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  warning_missiles_hypersonic_propulsion(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  warning_military_early_warning(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  warning_military_fast_deployments(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),

  // military
  military_barracks_cost(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  military_barracks_time(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  military_factory_cost(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  military_factory_time(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  military_airfield_cost(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  military_airfield_time(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),

  // weapons
  weapons_fission_bomb(
    // TODO(momo): apply
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 7,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  weapons_fusion_bomb(
    // TODO(momo): apply
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 7,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),

  // resilience
  resilience_emergency_planning(
    // TODO(momo): apply
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),

  // intel
  intel_economy(
    // TODO(momo): apply
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 2,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  intel_military(
    // TODO(momo): apply
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 2,
    initialCost: {
      ResourceType.technology: 100,
    },
  ),
  intel_technology(
    // TODO(momo): apply
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 2,
    initialCost: {
      ResourceType.technology: 100,
    },
  );

  final String sprite;
  final int maxLevel;
  final ResourceMap initialCost;

  const ResearchType({
    required this.sprite,
    required this.maxLevel,
    required this.initialCost,
  });

  double get rate => Constants.RESEARCH_RATE[this] ?? 0;

  String get rateDescription => Formatter.rate(rate);

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
      case intel_economy:
        return 'Economy';
      case intel_military:
        return 'Military';
      case intel_technology:
        return 'Technology';
    }
  }

  String get description {
    switch (this) {
      case resources_grid_management:
        return 'Increases energy production by $rateDescription';
      case resources_production_chain:
        return 'Increases supplies production by $rateDescription';
      case resources_indoctrination:
        return 'Increases population production by $rateDescription';
      case resources_quantum_computing:
        return 'Increases technology production by $rateDescription';
      case missiles_additive_manufacturing:
        return 'Decreases missile cost production by $rateDescription';
      case missiles_assembly_automation:
        return 'Decreases missile time production by $rateDescription';
      case missiles_enhanced_guidance_systems:
        return 'Increases defense missiles effectiveness by $rateDescription';
      case missiles_signal_jamming:
        return 'Decreases defense missiles effectiveness by $rateDescription';
      case warning_missiles_radar_network:
        return 'Increases the warning time when receiving a missile attack by $rateDescription';
      case warning_missiles_hypersonic_propulsion:
        return 'Decreases the warning time when launching a missile attack by $rateDescription';
      case warning_military_early_warning:
        return 'Increases the warning time when receiving a military invasion by $rateDescription';
      case warning_military_fast_deployments:
        return 'Decreases the warning time when launching a military invasion by $rateDescription';
      case military_barracks_cost:
        return 'Decreases infantry cost production by $rateDescription';
      case military_barracks_time:
        return 'Decreases infantry time production by $rateDescription';
      case military_factory_cost:
        return 'Decreases vehicles cost production by $rateDescription';
      case military_factory_time:
        return 'Decreases vehicles time production by $rateDescription';
      case military_airfield_cost:
        return 'Decreases aircraft cost production by $rateDescription';
      case military_airfield_time:
        return 'Decreases aircraft time production by $rateDescription';
      case weapons_fission_bomb:
        return 'Increases fission bomb yield by 2x';
      case weapons_fusion_bomb:
        return 'Increases fusion bomb yield by 2x';
      case resilience_emergency_planning:
        return 'Decrease the amount of casualties by $rateDescription';
      case intel_economy:
        return "Level 1: Global players' ranking\nLevel 2: Players's building level";
      case intel_military:
        return "Level 1: Global players' ranking\nLevel 2: Players's building level";
      case intel_technology:
        return "Level 1: Global players' ranking\nLevel 2: Players's building level";
    }
  }
}
