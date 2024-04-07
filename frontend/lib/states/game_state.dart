import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/producers/power_plant.dart';
import 'package:nucleartension/models/buildings/producers/propaganda_station.dart';
import 'package:nucleartension/models/buildings/producers/supply_center.dart';
import 'package:nucleartension/models/buildings/producers/tech_lab.dart';
import 'package:nucleartension/models/buildings/trainers/military_facility.dart';
import 'package:nucleartension/models/buildings/trainers/missile_silo.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/inventory/military_inventory.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/players/passive_player.dart';
import 'package:nucleartension/models/players/self_player.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/military_type.dart';
import 'package:nucleartension/types/research_type.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/types/unit_type.dart';

class GameState extends BaseState {
  late final Game game;

  GameState() {
    game = Game(
      players: [],
      timeElapsed: 0,
      defcon: 5,
    );

    final SelfPlayer player = SelfPlayer(
      game: game,
      name: 'Momo',
      color: Colors.red,
      resources: ResourceInventory.create({
        ResourceType.energy: 200,
        ResourceType.supplies: 200,
        ResourceType.population: 1000000,
        ResourceType.technology: 200,
      }),
      military: MilitaryInventory.create({
        MilitaryType.power: 10,
        MilitaryType.defense_missiles: 5,
        MilitaryType.attack_missiles: 0,
      }),
      buildings: {},
      researches: {},
    );

    player.addResearches([
      // resources
      Research(
        player: player,
        researchType: ResearchType.resources_energy,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.resources_supplies,
        level: 1,
      ),
      Research(
        player: player,
        researchType: ResearchType.resources_population,
        level: 2,
      ),
      Research(
        player: player,
        researchType: ResearchType.resources_technology,
        level: 3,
      ),

      // missiles
      Research(
        player: player,
        researchType: ResearchType.missiles_additive_manufacturing,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.missiles_assembly_automation,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.missiles_enhanced_guidance_systems,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.missiles_signal_jamming,
        level: 0,
      ),

      // warning
      Research(
        player: player,
        researchType: ResearchType.warning_missiles_radar_network,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.warning_missiles_hypersonic_propulsion,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.warning_military_early_warning,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.warning_military_fast_deployments,
        level: 0,
      ),

      // military
      Research(
        player: player,
        researchType: ResearchType.military_barracks_cost,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.military_barracks_time,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.military_factory_cost,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.military_factory_time,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.military_airfield_cost,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.military_airfield_time,
        level: 0,
      ),

      // weapons
      Research(
        player: player,
        researchType: ResearchType.weapons_fission_bomb,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.weapons_fusion_bomb,
        level: 0,
      ),

      // resilience
      Research(
        player: player,
        researchType: ResearchType.resilience_emergency_planning,
        level: 0,
      ),

      // intel
      Research(
        player: player,
        researchType: ResearchType.intel_economy_1,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.intel_economy_2,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.intel_military_1,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.intel_military_2,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.intel_technology_1,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.intel_technology_2,
        level: 0,
      ),
    ]);

    player.addBuildings([
      PowerPlant(
        player: player,
        level: 1,
      ),
      SupplyCenter(
        player: player,
        level: 1,
      ),
      TechLab(
        player: player,
        level: 0,
      ),
      PropagandaStation(
        player: player,
        level: 0,
      ),
      MilitaryFacility(
        player: player,
        level: 1,
        queues: {
          UnitType.infantry: [],
          UnitType.vehicle: [],
          UnitType.aircraft: [],
        },
      ),
      MissileSilo(
        player: player,
        level: 1,
        queues: {
          UnitType.defense: [],
          UnitType.attack: [],
        },
      ),
    ]);

    game.setPlayers([
      player,
      PassivePlayer(
        game: game,
        name: 'Bob',
        color: Colors.blue,
        resources: ResourceInventory.empty(),
        military: MilitaryInventory.empty(),
        buildings: {},
        researches: {},
      ),
      PassivePlayer(
        game: game,
        name: 'Max',
        color: Colors.green,
        resources: ResourceInventory.empty(),
        military: MilitaryInventory.empty(),
        buildings: {},
        researches: {},
      ),
      PassivePlayer(
        game: game,
        name: 'Ray',
        color: Colors.yellow,
        resources: ResourceInventory.empty(),
        military: MilitaryInventory.empty(),
        buildings: {},
        researches: {},
      ),
      PassivePlayer(
        game: game,
        name: 'Tom',
        color: Colors.pink,
        resources: ResourceInventory.empty(),
        military: MilitaryInventory.empty(),
        buildings: {},
        researches: {},
      ),
    ]);
  }

  void update(double dt) {
    game.update(dt);
  }
}
