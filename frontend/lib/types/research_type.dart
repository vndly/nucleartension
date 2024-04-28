import 'dart:math';
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
    costRate: 2,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  resources_production_chain(
    sprite: Assets.IMAGES_RESEARCH_RESOURCES_PRODUCTION_CHAIN,
    maxLevel: 10,
    costRate: 2,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  resources_quantum_computing(
    sprite: Assets.IMAGES_RESEARCH_RESOURCES_QUANTUM_COMPUTING,
    maxLevel: 10,
    costRate: 2,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  resources_indoctrination(
    sprite: Assets.IMAGES_RESEARCH_RESOURCES_INDOCTRINATION,
    maxLevel: 10,
    costRate: 2,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),

  // missiles
  missiles_additive_manufacturing(
    sprite: Assets.IMAGES_RESEARCH_MISSILES_ADDITIVE_MANUFACTURING,
    maxLevel: 5,
    costRate: 2,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  missiles_assembly_automation(
    sprite: Assets.IMAGES_RESEARCH_MISSILES_ASSEMBLY_AUTOMATION,
    maxLevel: 5,
    costRate: 2,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  missiles_active_tracking(
    sprite: Assets.IMAGES_RESEARCH_MISSILES_ACTIVE_TRACKING,
    maxLevel: 10,
    costRate: 2,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  missiles_signal_jamming(
    sprite: Assets.IMAGES_RESEARCH_MISSILES_SIGNAL_JAMMING,
    maxLevel: 5,
    costRate: 2,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  missiles_nuclear_bomb(
    sprite: Assets.IMAGES_RESEARCH_MISSILES_NUCLEAR_BOMB,
    maxLevel: 14,
    costRate: 2,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),

  // troops
  troop_cost(
    sprite: Assets.IMAGES_RESEARCH_TROOPS_COST, // TODO(momo): change
    maxLevel: 5,
    costRate: 2,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  troop_time(
    sprite: Assets.IMAGES_RESEARCH_TROOPS_TIME, // TODO(momo): change
    maxLevel: 5,
    costRate: 2,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),

  // warning
  warning_missiles_radar_network(
    sprite: Assets.IMAGES_RESEARCH_WARNING_MISSILES_RADAR_NETWORK,
    maxLevel: 5,
    costRate: 2,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  warning_missiles_hypersonic_propulsion(
    sprite: Assets.IMAGES_RESEARCH_WARNING_MISSILES_HYPERSONIC_PROPULSION,
    maxLevel: 5,
    costRate: 2,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  warning_troops_early_warning(
    sprite: Assets.IMAGES_RESEARCH_WARNING_TROOPS_EARLY_WARNING,
    maxLevel: 5,
    costRate: 2,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),
  warning_troops_fast_deployments(
    sprite: Assets.IMAGES_RESEARCH_WARNING_TROOPS_FAST_DEPLOYMENTS,
    maxLevel: 5,
    costRate: 2,
    initialCost: {
      ResourceType.technology: 10,
    },
  ),

  // intel
  intel_population(
    sprite: Assets.IMAGES_RESEARCH_INTEL_POPULATION,
    maxLevel: 2,
    costRate: 2,
    initialCost: {
      ResourceType.technology: 50,
    },
  ),
  intel_troops(
    sprite: Assets.IMAGES_RESEARCH_INTEL_TROOPS,
    maxLevel: 2,
    costRate: 2,
    initialCost: {
      ResourceType.technology: 50,
    },
  ),
  intel_missiles(
    sprite: Assets.IMAGES_RESEARCH_INTEL_MISSILES,
    maxLevel: 2,
    costRate: 2,
    initialCost: {
      ResourceType.technology: 50,
    },
  ),
  intel_research(
    sprite: Assets.IMAGES_RESEARCH_INTEL_RESEARCH,
    maxLevel: 2,
    costRate: 2,
    initialCost: {
      ResourceType.technology: 50,
    },
  );

  final String sprite;
  final int maxLevel;
  final double costRate;
  final ResourceMap initialCost;

  const ResearchType({
    required this.sprite,
    required this.maxLevel,
    required this.costRate,
    required this.initialCost,
  });

  double get rate => Constants.RESEARCH_RATE[this] ?? 0;

  ResourceMap cost(int level) => initialCost.multiply(pow(costRate, level - 1));

  String get localized {
    switch (this) {
      case resources_grid_management:
        return Localized.get.typeResearchResourcesGridManagementName;
      case resources_production_chain:
        return Localized.get.typeResearchResourcesProductionChainName;
      case resources_indoctrination:
        return Localized.get.typeResearchResourcesIndoctrinationName;
      case resources_quantum_computing:
        return Localized.get.typeResearchResourcesQuantumComputingName;
      case missiles_additive_manufacturing:
        return Localized.get.typeResearchMissilesAdditiveManufacturingName;
      case missiles_assembly_automation:
        return Localized.get.typeResearchMissilesAssemblyAutomationName;
      case missiles_active_tracking:
        return Localized.get.typeResearchMissilesActiveTrackingName;
      case missiles_signal_jamming:
        return Localized.get.typeResearchMissilesSignalJammingName;
      case missiles_nuclear_bomb:
        return Localized.get.typeResearchMissilesNuclearBombName;
      case troop_cost:
        return Localized.get.typeResearchTroopsCostName;
      case troop_time:
        return Localized.get.typeResearchTroopsTimeName;
      case warning_missiles_radar_network:
        return Localized.get.typeResearchWarningRadarNetworkName;
      case warning_missiles_hypersonic_propulsion:
        return Localized.get.typeResearchWarningHypersonicPropulsionName;
      case warning_troops_early_warning:
        return Localized.get.typeResearchWarningEarlyWarningName;
      case warning_troops_fast_deployments:
        return Localized.get.typeResearchWarningFastDeploymentsName;
      case intel_population:
        return Localized.get.typeResearchIntelPopulationName;
      case intel_troops:
        return Localized.get.typeResearchIntelTroopsName;
      case intel_missiles:
        return Localized.get.typeResearchIntelMissilesName;
      case intel_research:
        return Localized.get.typeResearchIntelResearchName;
    }
  }

  String get description {
    switch (this) {
      case resources_grid_management:
        return Localized.get.typeResearchResourcesGridManagementDescription;
      case resources_production_chain:
        return Localized.get.typeResearchResourcesProductionChainDescription;
      case resources_indoctrination:
        return Localized.get.typeResearchResourcesIndoctrinationDescription;
      case resources_quantum_computing:
        return Localized.get.typeResearchResourcesQuantumComputingDescription;
      case missiles_additive_manufacturing:
        return Localized
            .get.typeResearchMissilesAdditiveManufacturingDescription;
      case missiles_assembly_automation:
        return Localized.get.typeResearchMissilesAssemblyAutomationDescription;
      case missiles_active_tracking:
        return Localized.get.typeResearchMissilesActiveTrackingDescription;
      case missiles_signal_jamming:
        return Localized.get.typeResearchMissilesSignalJammingDescription;
      case missiles_nuclear_bomb:
        return Localized.get.typeResearchMissilesNuclearBombDescription;
      case troop_cost:
        return Localized.get.typeResearchTroopsCostDescription;
      case troop_time:
        return Localized.get.typeResearchTroopsTimeDescription;
      case warning_missiles_radar_network:
        return Localized.get.typeResearchWarningRadarNetworkDescription;
      case warning_missiles_hypersonic_propulsion:
        return Localized.get.typeResearchWarningHypersonicPropulsionDescription;
      case warning_troops_early_warning:
        return Localized.get.typeResearchWarningEarlyWarningDescription;
      case warning_troops_fast_deployments:
        return Localized.get.typeResearchWarningFastDeploymentsDescription;
      case intel_population:
        return Localized.get.typeResearchIntelPopulationDescription;
      case intel_troops:
        return Localized.get.typeResearchIntelTroopsDescription;
      case intel_missiles:
        return Localized.get.typeResearchIntelMissilesDescription;
      case intel_research:
        return Localized.get.typeResearchIntelResearchDescription;
    }
  }

  List<String> get details => [
        '$description.',
        if (this == ResearchType.missiles_nuclear_bomb) ...[
          '',
          Localized.get.typeResearchMissilesNuclearBombDescriptionExtra,
        ],
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
      case warning_troops_early_warning:
      case warning_missiles_hypersonic_propulsion:
      case warning_troops_fast_deployments:
        return '+$baseRate';

      case missiles_additive_manufacturing:
      case missiles_assembly_automation:
      case missiles_signal_jamming:
      case troop_cost:
      case troop_time:
        return '-$baseRate';

      case missiles_nuclear_bomb:
        return Formatter.yield(Research.yield(level));

      case intel_population:
      case intel_troops:
      case intel_missiles:
      case intel_research:
        if (level == 1) {
          return Localized.get.typeResearchIntelLevel1;
        } else if (level == 2) {
          return Localized.get.typeResearchIntelLevel2;
        } else {
          return '';
        }
    }
  }
}
