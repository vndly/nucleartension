import 'package:dafluta/dafluta.dart';
import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/dialog/base_dialog.dart';
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
import 'package:nucleartension/utils/environment.dart';
import 'package:nucleartension/utils/navigation.dart';

class GameState extends BaseState {
  late final Game game;
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
      name: 'John',
      country: Country.usa,
      resources: ResourceInventory.create({
        ResourceType.energy: 500,
        ResourceType.supplies: 500,
        ResourceType.technology: 0,
        ResourceType.population: Constants.INITIAL_POPULATION,
      }),
      military: MilitaryInventory.create({
        MilitaryType.troop: 0,
        MilitaryType.missile_defense: 0,
        MilitaryType.missile_attack: 0,
      }),
      buildings: {},
      researches: {},
    );

    usa.addBuildings(_buildings(
      player: usa,
      map: {
        BuildingType.power_plant: 0,
        BuildingType.supply_center: 0,
      },
    ));

    usa.addResearches(_researches(
      player: usa,
      map: {
        ResearchType.intel_population: Environment.isDebug ? 2 : 0,
        ResearchType.intel_military: Environment.isDebug ? 2 : 0,
        ResearchType.intel_missiles: Environment.isDebug ? 2 : 0,
        ResearchType.intel_research: Environment.isDebug ? 2 : 0,
      },
    ));

    game.addPlayers([
      usa,
      _activePlayer(
        name: 'Sergey',
        country: Country.russia,
        profile: PlayerProfile.aggressiveTroops(),
      ),
      _activePlayer(
        name: 'Ming',
        country: Country.china,
        profile: PlayerProfile.aggressiveMix(),
      ),
      _activePlayer(
        name: 'Harry',
        country: Country.uk,
        profile: PlayerProfile.neutral(),
      ),
      _activePlayer(
        name: 'Louis',
        country: Country.france,
        profile: PlayerProfile.defensive(),
      ),
      _activePlayer(
        name: 'Jong',
        country: Country.north_korea,
        profile: PlayerProfile.aggressiveMissiles(),
      ),
      _activePlayer(
        name: 'Ram',
        country: Country.india,
        profile: PlayerProfile.aggressiveTroops(),
      ),
      _activePlayer(
        name: 'Muhammad',
        country: Country.pakistan,
        profile: PlayerProfile.aggressiveMissiles(),
      ),
      _activePlayer(
        name: 'Ariel',
        country: Country.israel,
        profile: PlayerProfile.neutral(),
      ),
    ]);
  }

  Player _activePlayer({
    required String name,
    required Country country,
    required PlayerProfile profile,
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
        MilitaryType.troop: 0,
        MilitaryType.missile_defense: 0,
        MilitaryType.missile_attack: 0,
      }),
      buildings: {},
      researches: {},
      profile: profile,
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
            MilitaryType.troop: [],
          },
        ),
        MissileSilo(
          player: player,
          level: map[BuildingType.missile_silo] ?? 0,
          queues: {
            MilitaryType.missile_defense: [],
            MilitaryType.missile_attack: [],
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
    if (!finished && !BaseDialog.hasInstances) {
      game.update(dt);
    }
  }

  void onPause() {
    if (!finished) {
      PauseDialog.show(
        onResume: _onResume,
        onQuit: _onQuit,
      );
    }
  }

  void _onResume() {}

  void _onQuit() => Delayed.post(Navigation.pop);

  void onPlayerWon() {
    finished = true;
    InformationDialog.playerWon(_onQuit);
  }

  void onPlayerLost(Player killer) {
    finished = true;
    InformationDialog.playerLost(
      killer: killer,
      onAccept: _onQuit,
    );
  }
}
