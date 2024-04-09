import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/extensions/item_map_extension.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/assets.dart';
import 'package:nucleartension/utils/formatter.dart';

enum ResearchType {
  // resources
  resources_grid_management(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 10,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  resources_production_chain(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 10,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  resources_indoctrination(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 10,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  resources_quantum_computing(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 10,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),

  // missiles
  missiles_additive_manufacturing(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  missiles_assembly_automation(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  missiles_active_tracking(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 10,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  missiles_signal_jamming(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),

  // warning
  warning_missiles_radar_network(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  warning_missiles_hypersonic_propulsion(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  warning_military_early_warning(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  warning_military_fast_deployments(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),

  // military
  military_infantry_cost(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  military_infantry_time(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  military_vehicles_cost(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  military_vehicles_time(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  military_aircraft_cost(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  military_aircraft_time(
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),

  // weapons
  weapons_nuclear_bomb(
    // TODO(momo): apply
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 14,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),

  // resilience
  resilience_emergency_planning(
    // TODO(momo): apply
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),

  // intel
  intel_economy(
    // TODO(momo): apply
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 2,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  intel_military(
    // TODO(momo): apply
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 2,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  intel_technology(
    // TODO(momo): apply
    sprite: Assets.IMAGES_RESEARCH_RESEARCH,
    maxLevel: 2,
    initialCost: {
      ResourceType.technology: 10,
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
      case missiles_active_tracking:
        return 'Active Tracking';
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
      case military_infantry_cost:
        return 'Infantry Cost';
      case military_infantry_time:
        return 'Infantry Time';
      case military_vehicles_cost:
        return 'Vehicles Cost';
      case military_vehicles_time:
        return 'Vehicles Time';
      case military_aircraft_cost:
        return 'Aircraft Cost';
      case military_aircraft_time:
        return 'Aircraft Time';
      case weapons_nuclear_bomb:
        return 'Nuclear Bomb';
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
        return 'Increases energy production';
      case resources_production_chain:
        return 'Increases supplies production';
      case resources_indoctrination:
        return 'Increases population production';
      case resources_quantum_computing:
        return 'Increases technology production';
      case missiles_additive_manufacturing:
        return 'Decreases missile cost production';
      case missiles_assembly_automation:
        return 'Decreases missile time production';
      case missiles_active_tracking:
        return 'Increases defense missiles effectiveness';
      case missiles_signal_jamming:
        return 'Decreases defense missiles effectiveness';
      case warning_missiles_radar_network:
        return 'Increases warning time when receiving a missile attack';
      case warning_missiles_hypersonic_propulsion:
        return 'Decreases warning time when launching a missile attack';
      case warning_military_early_warning:
        return 'Increases warning time when receiving a military attack';
      case warning_military_fast_deployments:
        return 'Decreases warning time when launching a military attack';
      case military_infantry_cost:
        return 'Decreases infantry cost production';
      case military_infantry_time:
        return 'Decreases infantry time production';
      case military_vehicles_cost:
        return 'Decreases vehicles cost production';
      case military_vehicles_time:
        return 'Decreases vehicles time production';
      case military_aircraft_cost:
        return 'Decreases aircraft cost production';
      case military_aircraft_time:
        return 'Decreases aircraft time production';
      case weapons_nuclear_bomb:
        return 'Increases nuclear bomb yield';
      case resilience_emergency_planning:
        return 'Decrease the amount of casualties';
      case intel_economy:
        return 'Reveals economy intel about other players';
      case intel_military:
        return 'Reveals military intel about other players';
      case intel_technology:
        return 'Reveals technology intel about other players';
    }
  }

  String get details => '$description.\n\n$levelDetails';

  String get levelDetails {
    String result = '';

    for (int i = 1; i <= maxLevel; i++) {
      if (result.isNotEmpty) {
        result += '\n';
      }

      result += 'Level $i: ${rateDescription(i)}';
    }

    return result;
  }

  String rateDescription(int level) {
    final String baseRate = Formatter.rate(rate * level);

    switch (this) {
      case resources_grid_management:
      case resources_production_chain:
      case resources_indoctrination:
      case resources_quantum_computing:
      case missiles_active_tracking:
      case warning_missiles_radar_network:
      case warning_military_early_warning:
        return '+$baseRate';

      case missiles_additive_manufacturing:
      case missiles_assembly_automation:
      case missiles_signal_jamming:
      case warning_missiles_hypersonic_propulsion:
      case warning_military_fast_deployments:
      case military_infantry_cost:
      case military_infantry_time:
      case military_vehicles_cost:
      case military_vehicles_time:
      case military_aircraft_cost:
      case military_aircraft_time:
      case resilience_emergency_planning:
        return '-$baseRate';

      case weapons_nuclear_bomb:
        return Formatter.yield(Research.yield(level));

      case intel_economy:
      case intel_military:
      case intel_technology:
        if (level == 1) {
          return "Global players' ranking";
        } else if (level == 2) {
          return "Players's building level";
        } else {
          return '';
        }
    }
  }
}
