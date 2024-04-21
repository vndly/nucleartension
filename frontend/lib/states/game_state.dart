import 'package:dafluta/dafluta.dart';
import 'package:nucleartension/dialog/information_dialog.dart';
import 'package:nucleartension/dialog/pause_dialog.dart';
import 'package:nucleartension/models/buildings/producers/power_plant.dart';
import 'package:nucleartension/models/buildings/producers/propaganda_station.dart';
import 'package:nucleartension/models/buildings/producers/supply_center.dart';
import 'package:nucleartension/models/buildings/producers/tech_lab.dart';
import 'package:nucleartension/models/buildings/trainers/military_facility.dart';
import 'package:nucleartension/models/buildings/trainers/missile_silo.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/inventory/military_inventory.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/players/active_player.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/players/self_player.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/country.dart';
import 'package:nucleartension/types/military_type.dart';
import 'package:nucleartension/types/research_type.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/types/unit_type.dart';
import 'package:nucleartension/utils/navigation.dart';

class GameState extends BaseState {
  late final Game game;
  bool running = true;
  bool finished = false;

  GameState() {
    game = Game(
      gameState: this,
      players: [],
      events: [],
      attacks: [],
      timeElapsed: 0,
      defcon: 5,
    );

    final Player player = SelfPlayer(
      game: game,
      name: 'Momo',
      country: Country.usa,
      resources: ResourceInventory.create({
        ResourceType.energy: 500,
        ResourceType.supplies: 500,
        ResourceType.technology: 0,
        ResourceType.population: 1000000,
      }),
      military: MilitaryInventory.create({
        MilitaryType.power: 0,
        MilitaryType.defense_missiles: 0,
        MilitaryType.attack_missiles: 0,
      }),
      buildings: {},
      researches: {},
    );

    player.addResearches([
      // resources
      Research(
        player: player,
        researchType: ResearchType.resources_grid_management,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.resources_production_chain,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.resources_indoctrination,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.resources_quantum_computing,
        level: 0,
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
        researchType: ResearchType.missiles_active_tracking,
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
        researchType: ResearchType.unit_infantry_cost,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.unit_infantry_time,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.unit_vehicles_cost,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.unit_vehicles_time,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.unit_aircraft_cost,
        level: 0,
      ),
      Research(
        player: player,
        researchType: ResearchType.unit_aircraft_time,
        level: 0,
      ),

      // weapons
      Research(
        player: player,
        researchType: ResearchType.weapons_nuclear_bomb,
        level: 5,
      ),

      // intel
      Research(
        player: player,
        researchType: ResearchType.intel_population,
        level: 2,
      ),
      Research(
        player: player,
        researchType: ResearchType.intel_military,
        level: 2,
      ),
      Research(
        player: player,
        researchType: ResearchType.intel_research,
        level: 2,
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
      ActivePlayer(
        game: game,
        name: 'Sergey',
        country: Country.russia,
        resources: ResourceInventory.create({
          ResourceType.energy: 500,
          ResourceType.supplies: 500,
          ResourceType.technology: 0,
          ResourceType.population: 1000000,
        }),
        military: MilitaryInventory.create({
          MilitaryType.power: 0,
          MilitaryType.defense_missiles: 0,
          MilitaryType.attack_missiles: 0,
        }),
        buildings: {},
        researches: {},
        profile: PlayerProfile.aggressive(),
      ),
      ActivePlayer(
        game: game,
        name: 'Ming',
        country: Country.china,
        resources: ResourceInventory.create({
          ResourceType.energy: 500,
          ResourceType.supplies: 500,
          ResourceType.technology: 0,
          ResourceType.population: 1000000,
        }),
        military: MilitaryInventory.create({
          MilitaryType.power: 0,
          MilitaryType.defense_missiles: 0,
          MilitaryType.attack_missiles: 0,
        }),
        buildings: {},
        researches: {},
        profile: PlayerProfile.aggressive(),
      ),
      ActivePlayer(
        game: game,
        name: 'Harry',
        country: Country.uk,
        resources: ResourceInventory.create({
          ResourceType.energy: 500,
          ResourceType.supplies: 500,
          ResourceType.technology: 0,
          ResourceType.population: 1000000,
        }),
        military: MilitaryInventory.create({
          MilitaryType.power: 0,
          MilitaryType.defense_missiles: 0,
          MilitaryType.attack_missiles: 0,
        }),
        buildings: {},
        researches: {},
        profile: PlayerProfile.aggressive(),
      ),
      ActivePlayer(
        game: game,
        name: 'Louis',
        country: Country.france,
        resources: ResourceInventory.create({
          ResourceType.energy: 500,
          ResourceType.supplies: 500,
          ResourceType.technology: 0,
          ResourceType.population: 1000000,
        }),
        military: MilitaryInventory.create({
          MilitaryType.power: 0,
          MilitaryType.defense_missiles: 0,
          MilitaryType.attack_missiles: 0,
        }),
        buildings: {},
        researches: {},
        profile: PlayerProfile.aggressive(),
      ),
      ActivePlayer(
        game: game,
        name: 'Jong',
        country: Country.north_korea,
        resources: ResourceInventory.create({
          ResourceType.energy: 500,
          ResourceType.supplies: 500,
          ResourceType.technology: 0,
          ResourceType.population: 1000000,
        }),
        military: MilitaryInventory.create({
          MilitaryType.power: 0,
          MilitaryType.defense_missiles: 0,
          MilitaryType.attack_missiles: 0,
        }),
        buildings: {},
        researches: {},
        profile: PlayerProfile.aggressive(),
      ),
      ActivePlayer(
        game: game,
        name: 'Ram',
        country: Country.india,
        resources: ResourceInventory.create({
          ResourceType.energy: 500,
          ResourceType.supplies: 500,
          ResourceType.technology: 0,
          ResourceType.population: 1000000,
        }),
        military: MilitaryInventory.create({
          MilitaryType.power: 0,
          MilitaryType.defense_missiles: 0,
          MilitaryType.attack_missiles: 0,
        }),
        buildings: {},
        researches: {},
        profile: PlayerProfile.aggressive(),
      ),
      ActivePlayer(
        game: game,
        name: 'Muhammad',
        country: Country.pakistan,
        resources: ResourceInventory.create({
          ResourceType.energy: 500,
          ResourceType.supplies: 500,
          ResourceType.technology: 0,
          ResourceType.population: 1000000,
        }),
        military: MilitaryInventory.create({
          MilitaryType.power: 0,
          MilitaryType.defense_missiles: 0,
          MilitaryType.attack_missiles: 0,
        }),
        buildings: {},
        researches: {},
        profile: PlayerProfile.aggressive(),
      ),
      ActivePlayer(
        game: game,
        name: 'Ariel',
        country: Country.israel,
        resources: ResourceInventory.create({
          ResourceType.energy: 500,
          ResourceType.supplies: 500,
          ResourceType.technology: 0,
          ResourceType.population: 1000000,
        }),
        military: MilitaryInventory.create({
          MilitaryType.power: 0,
          MilitaryType.defense_missiles: 0,
          MilitaryType.attack_missiles: 0,
        }),
        buildings: {},
        researches: {},
        profile: PlayerProfile.aggressive(),
      ),
    ]);
  }

  void update(double dt) {
    if (running) {
      game.update(dt);
    }
  }

  void onPause() {
    if (!finished) {
      running = false;
      PauseDialog.show(
        onResume: _onResume,
        onQuit: _onQuit,
      );
    }
  }

  void _onResume() {
    running = true;
  }

  void _onQuit() => Delayed.post(Navigation.pop);

  void onPlayerWon() {
    running = false;
    finished = true;
    InformationDialog.playerWon(_onQuit);
  }

  void onPlayerLost(Player killer) {
    running = false;
    finished = true;
    InformationDialog.playerLost(
      killer: killer,
      onAccept: _onQuit,
    );
  }
}
