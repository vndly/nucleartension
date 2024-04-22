import 'package:dafluta/dafluta.dart';
import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/dialog/information_dialog.dart';
import 'package:nucleartension/dialog/pause_dialog.dart';
import 'package:nucleartension/models/buildings/building.dart';
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
import 'package:nucleartension/types/building_type.dart';
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

    final Player usa = SelfPlayer(
      game: game,
      name: 'Momo',
      country: Country.usa,
      resources: ResourceInventory.create({
        ResourceType.energy: 500,
        ResourceType.supplies: 500,
        ResourceType.technology: 1000,
        ResourceType.population: Constants.INITIAL_POPULATION,
      }),
      military: MilitaryInventory.create({
        MilitaryType.power: 0,
        MilitaryType.defense_missiles: 0,
        MilitaryType.attack_missiles: 0,
      }),
      buildings: {},
      researches: {},
    );

    usa.addBuildings(_buildings(
      player: usa,
      map: {
        BuildingType.power_plant: 1,
        BuildingType.supply_center: 1,
      },
    ));

    usa.addResearches(_researches(
      player: usa,
      map: {
        ResearchType.intel_population: 2,
        ResearchType.intel_military: 2,
        ResearchType.intel_missiles: 2,
        ResearchType.intel_research: 2,
      },
    ));

    game.setPlayers([
      usa,
      _activePlayer(name: 'Sergey', country: Country.russia),
      _activePlayer(name: 'Ming', country: Country.china),
      _activePlayer(name: 'Harry', country: Country.uk),
      _activePlayer(name: 'Louis', country: Country.france),
      _activePlayer(name: 'Jong', country: Country.north_korea),
      _activePlayer(name: 'Ram', country: Country.india),
      _activePlayer(name: 'Muhammad', country: Country.pakistan),
      _activePlayer(name: 'Ariel', country: Country.israel),
    ]);
  }

  Player _activePlayer({
    required String name,
    required Country country,
  }) {
    final Player player = ActivePlayer(
      game: game,
      name: name,
      country: country,
      resources: ResourceInventory.create({
        ResourceType.energy: 500,
        ResourceType.supplies: 500,
        ResourceType.technology: 0,
        ResourceType.population: Constants.INITIAL_POPULATION,
      }),
      military: MilitaryInventory.create({
        MilitaryType.power: 0,
        MilitaryType.defense_missiles: 0,
        MilitaryType.attack_missiles: 0,
      }),
      buildings: {},
      researches: {},
      profile: PlayerProfile.aggressive(),
    );

    player.addBuildings(_buildings(
      player: player,
      map: {
        BuildingType.power_plant: 1,
        BuildingType.supply_center: 1,
      },
    ));

    player.addResearches(_researches(
      player: player,
      map: {},
    ));

    return player;
  }

  List<Building> _buildings({
    required Player player,
    required Map<BuildingType, int> map,
  }) =>
      [
        PowerPlant(
          player: player,
          level: map[BuildingType.power_plant] ?? 0,
        ),
        SupplyCenter(
          player: player,
          level: map[BuildingType.supply_center] ?? 0,
        ),
        TechLab(
          player: player,
          level: map[BuildingType.tech_lab] ?? 0,
        ),
        PropagandaStation(
          player: player,
          level: map[BuildingType.propaganda_station] ?? 0,
        ),
        MilitaryFacility(
          player: player,
          level: map[BuildingType.military_facility] ?? 0,
          queues: {
            UnitType.infantry: [],
            UnitType.vehicle: [],
            UnitType.aircraft: [],
          },
        ),
        MissileSilo(
          player: player,
          level: map[BuildingType.missile_silo] ?? 0,
          queues: {
            UnitType.defense: [],
            UnitType.attack: [],
          },
        ),
      ];

  List<Research> _researches({
    required Player player,
    required Map<ResearchType, int> map,
  }) {
    final List<Research> result = [];

    for (final ResearchType researchType in ResearchType.values) {
      result.add(Research(
        player: player,
        researchType: researchType,
        level: map[researchType] ?? 0,
      ));
    }

    return result;
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
