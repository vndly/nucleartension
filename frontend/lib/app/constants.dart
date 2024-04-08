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
    ResearchType.resources_grid_management: 0.1,
    ResearchType.resources_production_chain: 0.1,
    ResearchType.resources_indoctrination: 0.1,
    ResearchType.resources_quantum_computing: 0.1,
    ResearchType.missiles_additive_manufacturing: 0.1,
    ResearchType.missiles_assembly_automation: 0.1,
    ResearchType.missiles_enhanced_guidance_systems: 0.1,
    ResearchType.missiles_signal_jamming: 0.1,
    ResearchType.warning_missiles_radar_network: 0.1,
    ResearchType.warning_missiles_hypersonic_propulsion: 0.1,
    ResearchType.warning_military_early_warning: 0.1,
    ResearchType.warning_military_fast_deployments: 0.1,
    ResearchType.military_barracks_cost: 0.1,
    ResearchType.military_barracks_time: 0.1,
    ResearchType.military_factory_cost: 0.1,
    ResearchType.military_factory_time: 0.1,
    ResearchType.military_airfield_cost: 0.1,
    ResearchType.military_airfield_time: 0.1,
    ResearchType.resilience_emergency_planning: 0.1,
  };
}
