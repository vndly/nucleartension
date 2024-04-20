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
      case warning_missiles_radar_network:
        return Localized.get.typeResearchWarningRadarNetworkName;
      case warning_missiles_hypersonic_propulsion:
        return Localized.get.typeResearchWarningHypersonicPropulsionName;
      case warning_military_early_warning:
        return Localized.get.typeResearchWarningEarlyWarningName;
      case warning_military_fast_deployments:
        return Localized.get.typeResearchWarningFastDeploymentsName;
      case military_infantry_cost:
        return Localized.get.typeResearchMilitaryInfantryCostName;
      case military_infantry_time:
        return Localized.get.typeResearchMilitaryInfantryTimeName;
      case military_vehicles_cost:
        return Localized.get.typeResearchMilitaryVehiclesCostName;
      case military_vehicles_time:
        return Localized.get.typeResearchMilitaryVehiclesTimeName;
      case military_aircraft_cost:
        return Localized.get.typeResearchMilitaryAircraftCostName;
      case military_aircraft_time:
        return Localized.get.typeResearchMilitaryAircraftTimeName;
      case weapons_nuclear_bomb:
        return Localized.get.typeResearchWeaponsNuclearBombName;
      case intel_population:
        return Localized.get.typeResearchIntelPopulationName;
      case intel_military:
        return Localized.get.typeResearchIntelMilitaryName;
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
      case warning_missiles_radar_network:
        return Localized.get.typeResearchWarningRadarNetworkDescription;
      case warning_missiles_hypersonic_propulsion:
        return Localized.get.typeResearchWarningHypersonicPropulsionDescription;
      case warning_military_early_warning:
        return Localized.get.typeResearchWarningEarlyWarningDescription;
      case warning_military_fast_deployments:
        return Localized.get.typeResearchWarningFastDeploymentsDescription;
      case military_infantry_cost:
        return Localized.get.typeResearchMilitaryInfantryCostDescription;
      case military_infantry_time:
        return Localized.get.typeResearchMilitaryInfantryTimeDescription;
      case military_vehicles_cost:
        return Localized.get.typeResearchMilitaryVehiclesCostDescription;
      case military_vehicles_time:
        return Localized.get.typeResearchMilitaryVehiclesTimeDescription;
      case military_aircraft_cost:
        return Localized.get.typeResearchMilitaryAircraftCostDescription;
      case military_aircraft_time:
        return Localized.get.typeResearchMilitaryAircraftTimeDescription;
      case weapons_nuclear_bomb:
        return Localized.get.typeResearchWeaponsNuclearBombDescription;
      case intel_population:
        return Localized.get.typeResearchIntelPopulationDescription;
      case intel_military:
        return Localized.get.typeResearchIntelMilitaryDescription;
      case intel_research:
        return Localized.get.typeResearchIntelResearchDescription;
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

      case intel_population:
      case intel_military:
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
