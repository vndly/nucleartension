import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/research_type.dart';

class Constants {
  static const String FONT_NAME = 'CustomFont';

  static const double DEFCON_PRODUCTION_RATE = 1.1;

  static const Map<BuildingType, double> PRODUCTION_RATE = {
    BuildingType.power_plant: 1,
    BuildingType.supply_center: 1,
    BuildingType.propaganda_station: 100,
    BuildingType.tech_lab: 0.5,
  };

  static const Map<ResearchType, double> RESEARCH_RATE = {
    ResearchType.resources_grid_management: 1.1,
    ResearchType.resources_production_chain: 1.1,
    ResearchType.resources_indoctrination: 1.1,
    ResearchType.resources_quantum_computing: 1.1,
    ResearchType.missiles_additive_manufacturing: 1.1,
    ResearchType.missiles_assembly_automation: 1.1,
    ResearchType.missiles_enhanced_guidance_systems: 1.1,
    ResearchType.missiles_signal_jamming: 1.1,
    ResearchType.warning_missiles_radar_network: 1.1,
    ResearchType.warning_missiles_hypersonic_propulsion: 1.1,
    ResearchType.warning_military_early_warning: 1.1,
    ResearchType.warning_military_fast_deployments: 1.1,
    ResearchType.military_barracks_cost: 1.1,
    ResearchType.military_barracks_time: 1.1,
    ResearchType.military_factory_cost: 1.1,
    ResearchType.military_factory_time: 1.1,
    ResearchType.military_airfield_cost: 1.1,
    ResearchType.military_airfield_time: 1.1,
    ResearchType.resilience_emergency_planning: 1.1,
  };
}
