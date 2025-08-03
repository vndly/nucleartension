import 'dart:math';
import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/domain/models/research.dart';
import 'package:nucleartension/utils/assets.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/localizations.dart';

enum ResearchType {
  // resources
  resources_grid_management(
    sprite: Assets.IMAGES_RESEARCH_RESOURCES_GRID_MANAGEMENT,
    maxLevel: 10,
    costRate: 2,
    initialCost: 10,
  ),
  resources_production_chain(
    sprite: Assets.IMAGES_RESEARCH_RESOURCES_PRODUCTION_CHAIN,
    maxLevel: 10,
    costRate: 2,
    initialCost: 10,
  ),
  resources_quantum_computing(
    sprite: Assets.IMAGES_RESEARCH_RESOURCES_QUANTUM_COMPUTING,
    maxLevel: 10,
    costRate: 2,
    initialCost: 10,
  ),
  resources_indoctrination(
    sprite: Assets.IMAGES_RESEARCH_RESOURCES_INDOCTRINATION,
    maxLevel: 10,
    costRate: 2,
    initialCost: 10,
  ),

  // missiles
  missiles_additive_manufacturing(
    sprite: Assets.IMAGES_RESEARCH_MISSILES_ADDITIVE_MANUFACTURING,
    maxLevel: 5,
    costRate: 2,
    initialCost: 10,
  ),
  missiles_assembly_automation(
    sprite: Assets.IMAGES_RESEARCH_MISSILES_ASSEMBLY_AUTOMATION,
    maxLevel: 5,
    costRate: 2,
    initialCost: 10,
  ),
  missiles_active_tracking(
    sprite: Assets.IMAGES_RESEARCH_MISSILES_ACTIVE_TRACKING,
    maxLevel: 10,
    costRate: 2,
    initialCost: 10,
  ),
  missiles_signal_jamming(
    sprite: Assets.IMAGES_RESEARCH_MISSILES_SIGNAL_JAMMING,
    maxLevel: 5,
    costRate: 2,
    initialCost: 10,
  ),
  missiles_nuclear_bomb(
    sprite: Assets.IMAGES_RESEARCH_MISSILES_NUCLEAR_BOMB,
    maxLevel: 14,
    costRate: 2,
    initialCost: 10,
  ),

  // warning
  warning_missiles_radar_network(
    sprite: Assets.IMAGES_RESEARCH_WARNING_MISSILES_RADAR_NETWORK,
    maxLevel: 5,
    costRate: 2,
    initialCost: 10,
  ),
  warning_missiles_hypersonic_propulsion(
    sprite: Assets.IMAGES_RESEARCH_WARNING_MISSILES_HYPERSONIC_PROPULSION,
    maxLevel: 5,
    costRate: 2,
    initialCost: 10,
  ),

  // intel
  intel_population(
    sprite: Assets.IMAGES_RESEARCH_INTEL_POPULATION,
    maxLevel: 2,
    costRate: 2,
    initialCost: 10,
  ),
  intel_missiles(
    sprite: Assets.IMAGES_RESEARCH_INTEL_MISSILES,
    maxLevel: 2,
    costRate: 2,
    initialCost: 10,
  );

  final String sprite;
  final int maxLevel;
  final double costRate;
  final int initialCost;

  const ResearchType({
    required this.sprite,
    required this.maxLevel,
    required this.costRate,
    required this.initialCost,
  });

  double get rate => Constants.RESEARCH_RATE[this] ?? 0;

  int cost(int level) => (initialCost * pow(costRate, level - 1)).toInt();

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
      case warning_missiles_radar_network:
        return Localized.get.typeResearchWarningRadarNetworkName;
      case warning_missiles_hypersonic_propulsion:
        return Localized.get.typeResearchWarningHypersonicPropulsionName;
      case intel_population:
        return Localized.get.typeResearchIntelPopulationName;
      case intel_missiles:
        return Localized.get.typeResearchIntelMissileName;
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
            .get
            .typeResearchMissilesAdditiveManufacturingDescription;
      case missiles_assembly_automation:
        return Localized.get.typeResearchMissilesAssemblyAutomationDescription;
      case missiles_active_tracking:
        return Localized.get.typeResearchMissilesActiveTrackingDescription;
      case missiles_signal_jamming:
        return Localized.get.typeResearchMissilesSignalJammingDescription;
      case missiles_nuclear_bomb:
        return Localized.get.typeResearchMissilesNuclearBombDescription;
      case warning_missiles_radar_network:
        return Localized.get.typeResearchWarningRadarNetworkDescription;
      case warning_missiles_hypersonic_propulsion:
        return Localized.get.typeResearchWarningHypersonicPropulsionDescription;
      case intel_population:
        return Localized.get.typeResearchIntelPopulationDescription;
      case intel_missiles:
        return Localized.get.typeResearchIntelMissileDescription;
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
      case warning_missiles_hypersonic_propulsion:
        return '+$baseRate';

      case missiles_additive_manufacturing:
      case missiles_assembly_automation:
      case missiles_signal_jamming:
        return '-$baseRate';

      case missiles_nuclear_bomb:
        return Formatter.yield(Research.yield(level));

      case intel_population:
      case intel_missiles:
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
