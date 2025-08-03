import 'package:nucleartension/domain/types/research_type.dart';

class Constants {
  static const String FONT_NAME = 'CustomFont';

  static const double MAP_SIZE_RATIO = 0.8;

  static const double PROPAGANDA_RATE_PER_LEVEL = 1;

  // Attacks
  static const int MISSILE_ATTACK_WARNING_TIME = 60; // in seconds
  static const int MISSILE_ATTACK_DAMAGE_PER_KT = 1000;

  static const Map<ResearchType, double> RESEARCH_RATE = {
    ResearchType.resources_grid_management: 0.1,
    ResearchType.resources_production_chain: 0.1,
    ResearchType.resources_indoctrination: 0.1,
    ResearchType.resources_quantum_computing: 0.1,
    ResearchType.missiles_additive_manufacturing: 0.1,
    ResearchType.missiles_assembly_automation: 0.1,
    ResearchType.missiles_active_tracking: 0.1,
    ResearchType.missiles_signal_jamming: 0.1,
    ResearchType.warning_missiles_radar_network: 0.1,
    ResearchType.warning_missiles_hypersonic_propulsion: 0.1,
  };
}
