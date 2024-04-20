import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/extensions/item_map_extension.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/assets.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/localizations.dart';

enum ResearchType {
  // resources
  resources_grid_management(
    sprite: Assets.IMAGES_RESEARCH_RESOURCES_GRID_MANAGEMENT,
    maxLevel: 10,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  resources_production_chain(
    sprite: Assets.IMAGES_RESEARCH_RESOURCES_PRODUCTION_CHAIN,
    maxLevel: 10,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  resources_indoctrination(
    sprite: Assets.IMAGES_RESEARCH_RESOURCES_INDOCTRINATION,
    maxLevel: 10,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  resources_quantum_computing(
    sprite: Assets.IMAGES_RESEARCH_RESOURCES_QUANTUM_COMPUTING,
    maxLevel: 10,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),

  // missiles
  missiles_additive_manufacturing(
    sprite: Assets.IMAGES_RESEARCH_MISSILES_ADDITIVE_MANUFACTURING,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  missiles_assembly_automation(
    sprite: Assets.IMAGES_RESEARCH_MISSILES_ASSEMBLY_AUTOMATION,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  missiles_active_tracking(
    sprite: Assets.IMAGES_RESEARCH_MISSILES_ACTIVE_TRACKING,
    maxLevel: 10,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  missiles_signal_jamming(
    sprite: Assets.IMAGES_RESEARCH_MISSILES_SIGNAL_JAMMING,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),

  // warning
  warning_missiles_radar_network(
    sprite: Assets.IMAGES_RESEARCH_WARNING_MISSILES_RADAR_NETWORK,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  warning_missiles_hypersonic_propulsion(
    sprite: Assets.IMAGES_RESEARCH_WARNING_MISSILES_HYPERSONIC_PROPULSION,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  warning_military_early_warning(
    sprite: Assets.IMAGES_RESEARCH_WARNING_MILITARY_EARLY_WARNING,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  warning_military_fast_deployments(
    sprite: Assets.IMAGES_RESEARCH_WARNING_MILITARY_FAST_DEPLOYMENTS,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),

  // military
  military_infantry_cost(
    sprite: Assets.IMAGES_RESEARCH_MILITARY_INFANTRY_COST,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  military_infantry_time(
    sprite: Assets.IMAGES_RESEARCH_MILITARY_INFANTRY_TIME,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  military_vehicles_cost(
    sprite: Assets.IMAGES_RESEARCH_MILITARY_VEHICLES_COST,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  military_vehicles_time(
    sprite: Assets.IMAGES_RESEARCH_MILITARY_VEHICLES_TIME,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  military_aircraft_cost(
    sprite: Assets.IMAGES_RESEARCH_MILITARY_AIRCRAFT_COST,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  military_aircraft_time(
    sprite: Assets.IMAGES_RESEARCH_MILITARY_AIRCRAFT_TIME,
    maxLevel: 5,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),

  // weapons
  weapons_nuclear_bomb(
    sprite: Assets.IMAGES_RESEARCH_WEAPONS_NUCLEAR_BOMB,
    maxLevel: 14,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),

  // intel
  intel_population(
    sprite: Assets.IMAGES_RESEARCH_INTEL_POPULATION,
    maxLevel: 2,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  intel_military(
    sprite: Assets.IMAGES_RESEARCH_INTEL_MILITARY,
    maxLevel: 2,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  intel_research(
    sprite: Assets.IMAGES_RESEARCH_INTEL_RESEARCH,
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

  // TODO(momo): localize
  String get localized {
    switch (this) {
      case resources_grid_management:
        return Localized.get.typeResearchGridManagementName;
      case resources_production_chain:
        return Localized.get.typeResearchProductionChainName;
      case resources_indoctrination:
        return Localized.get.typeResearchIndoctrinationName;
      case resources_quantum_computing:
        return Localized.get.typeResearchQuantumComputingName;
      case missiles_additive_manufacturing:
        return Localized.get.typeResearchAdditiveManufacturingName;
      case missiles_assembly_automation:
        return Localized.get.typeResearchAssemblyAutomationName;
      case missiles_active_tracking:
        return Localized.get.typeResearchActiveTrackingName;
      case missiles_signal_jamming:
        return Localized.get.typeResearchSignalJammingName;
      case warning_missiles_radar_network:
        return Localized.get.typeResearchRadarNetworkName;
      case warning_missiles_hypersonic_propulsion:
        return Localized.get.typeResearchHypersonicPropulsionName;
      case warning_military_early_warning:
        return Localized.get.typeResearchEarlyWarningName;
      case warning_military_fast_deployments:
        return Localized.get.typeResearchFastDeploymentsName;
      case military_infantry_cost:
        return Localized.get.typeResearchInfantryCostName;
      case military_infantry_time:
        return Localized.get.typeResearchInfantryTimeName;
      case military_vehicles_cost:
        return Localized.get.typeResearchVehiclesCostName;
      case military_vehicles_time:
        return Localized.get.typeResearchVehiclesTimeName;
      case military_aircraft_cost:
        return Localized.get.typeResearchAircraftCostName;
      case military_aircraft_time:
        return Localized.get.typeResearchAircraftTimeName;
      case weapons_nuclear_bomb:
        return 'Nuclear Bomb';
      case intel_population:
        return 'Population';
      case intel_military:
        return 'Military';
      case intel_research:
        return 'Research';
    }
  }

  // TODO(momo): localize
  String get description {
    switch (this) {
      case resources_grid_management:
        return Localized.get.typeResearchGridManagementDescription;
      case resources_production_chain:
        return Localized.get.typeResearchProductionChainDescription;
      case resources_indoctrination:
        return Localized.get.typeResearchIndoctrinationDescription;
      case resources_quantum_computing:
        return Localized.get.typeResearchQuantumComputingDescription;
      case missiles_additive_manufacturing:
        return Localized.get.typeResearchAdditiveManufacturingDescription;
      case missiles_assembly_automation:
        return Localized.get.typeResearchAssemblyAutomationDescription;
      case missiles_active_tracking:
        return Localized.get.typeResearchActiveTrackingDescription;
      case missiles_signal_jamming:
        return Localized.get.typeResearchSignalJammingDescription;
      case warning_missiles_radar_network:
        return Localized.get.typeResearchRadarNetworkDescription;
      case warning_missiles_hypersonic_propulsion:
        return Localized.get.typeResearchHypersonicPropulsionDescription;
      case warning_military_early_warning:
        return Localized.get.typeResearchEarlyWarningDescription;
      case warning_military_fast_deployments:
        return Localized.get.typeResearchFastDeploymentsDescription;
      case military_infantry_cost:
        return Localized.get.typeResearchInfantryCostDescription;
      case military_infantry_time:
        return Localized.get.typeResearchInfantryTimeDescription;
      case military_vehicles_cost:
        return Localized.get.typeResearchVehiclesCostDescription;
      case military_vehicles_time:
        return Localized.get.typeResearchVehiclesTimeDescription;
      case military_aircraft_cost:
        return Localized.get.typeResearchAircraftCostDescription;
      case military_aircraft_time:
        return Localized.get.typeResearchAircraftTimeDescription;
      case weapons_nuclear_bomb:
        return 'Increases nuclear bomb yield';
      case intel_population:
        return 'Reveals population intel about other players';
      case intel_military:
        return 'Reveals military intel about other players';
      case intel_research:
        return 'Reveals research intel about other players';
    }
  }

  List<String> get details => [
        '$description.',
        '',
        ...levelDetails,
      ];

  List<String> get levelDetails {
    final List<String> result = [];

    for (int i = 1; i <= maxLevel; i++) {
      result.add('${Localized.get.labelLevel} $i: ${rateDescription(i)}');
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
      case warning_missiles_hypersonic_propulsion:
      case warning_military_fast_deployments:
        return '+$baseRate';

      case missiles_additive_manufacturing:
      case missiles_assembly_automation:
      case missiles_signal_jamming:
      case military_infantry_cost:
      case military_infantry_time:
      case military_vehicles_cost:
      case military_vehicles_time:
      case military_aircraft_cost:
      case military_aircraft_time:
        return '-$baseRate';

      case weapons_nuclear_bomb:
        return Formatter.yield(Research.yield(level));

      // TODO(momo): localize
      case intel_population:
      case intel_military:
      case intel_research:
        if (level == 1) {
          return "Global players' ranking";
        } else if (level == 2) {
          return "Players's values";
        } else {
          return '';
        }
    }
  }
}
