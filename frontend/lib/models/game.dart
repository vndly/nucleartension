import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/dialog/attack_dialog.dart';
import 'package:nucleartension/models/attacks/army_attack.dart';
import 'package:nucleartension/models/attacks/attack.dart';
import 'package:nucleartension/models/attacks/missile_attack.dart';
import 'package:nucleartension/models/events/defcon_update_event.dart';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/events/player_defeated_event.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/players/self_player.dart';
import 'package:nucleartension/states/game_state.dart';
import 'package:nucleartension/utils/custom_snackbar.dart';
import 'package:nucleartension/utils/fps.dart';
import 'package:nucleartension/utils/probability.dart';

class Game {
  final GameState gameState;
  final List<Player> players;
  final List<Event> events;
  final List<Attack> attacks;
  final FPS fps = FPS();
  Player? selfPlayer;
  num timeElapsed = 0;
  int defcon = 5;

  Game({
    required this.gameState,
    required this.players,
    required this.events,
    required this.attacks,
    required this.timeElapsed,
    required this.defcon,
  });

  // ============================= PLAYERS ================================== \\

  Player get self => selfPlayer!;

  List<Player> get playersAlive => players.where((e) => e.isAlive).toList();

  List<Player> get playersByName {
    final List<Player> result = List.from(players);
    result.sort((a, b) {
      final int byAlive = (b.isAlive ? 1 : 0) - (a.isAlive ? 1 : 0);

      if (byAlive == 0) {
        return a.name.compareTo(b.name);
      } else {
        return byAlive;
      }
    });

    return result;
  }

  List<Player> get playersByPopulation {
    final List<Player> result = List.from(players);
    result.sort((a, b) => b.population - a.population);

    return result;
  }

  List<Player> get playersByArmies {
    final List<Player> result = List.from(players);
    result.sort((a, b) => b.armies - a.armies);

    return result;
  }

  List<Player> get playersByMissiles {
    final List<Player> result = List.from(players);
    result.sort((a, b) => b.amountOfMissiles - a.amountOfMissiles);

    return result;
  }

  List<Player> get playersByResearch {
    final List<Player> result = List.from(players);
    result.sort((a, b) => b.researchLevel - a.researchLevel);

    return result;
  }

  Player? randomPlayer(Player player) {
    final List<Player> list =
        players.where((e) => e.isAlive && (e != player)).toList();

    return Probability.element(list);
  }

  void addPlayers(List<Player> list) {
    players.addAll(list);
    selfPlayer = list.whereType<SelfPlayer>().first;
  }

  // ============================= EVENTS =================================== \\

  List<Event> get unseenEvents => visibleEvents.where((e) => !e.seen).toList();

  bool get hasUnseenEvents => unseenEvents.isNotEmpty;

  List<Event> get visibleEvents => events.where((e) => e.show).toList();

  void _addEvent(Event event) => events.insert(0, event);

  void _processEvents(List<Event> events) {
    bool playerDefeated = false;
    Player? killer;

    for (final Event event in events) {
      _addEvent(event);

      if (event is PlayerDefeated) {
        playerDefeated = true;

        if (event.player.isSelf) {
          killer = event.killer;
        }
      }
    }

    if (playerDefeated) {
      if (!self.isAlive) {
        gameState.onPlayerLost(killer!);
      } else if (playersAlive.length == 1) {
        gameState.onPlayerWon();
      }
    }
  }

  // ============================= DEFCON =================================== \\

  int get defconStep => 6 - defcon;

  void onArmyCreated(Player player) => _applyDefcon(
        player: player,
        level: 4,
      );

  void onArmyUsed(Player player) => _applyDefcon(
        player: player,
        level: 3,
      );

  void onAttackMissileCreated(Player player) => _applyDefcon(
        player: player,
        level: 2,
      );

  void onAttackMissileUsed(Player player) => _applyDefcon(
        player: player,
        level: 1,
      );

  void _applyDefcon({
    required Player player,
    required int level,
  }) {
    if (defcon > level) {
      defcon = level;
      CustomSnackbar.defcon(level);
      _addEvent(DefconUpdateEvent(
        player: player,
        defconLevel: defcon,
        productionBoost:
            Constants.DEFCON_PRODUCTION_RATE * (defconStep - 1) * 100,
      ));
    }
  }

  // ============================ MILITARY ================================== \\

  List<Attack> get selfAttacks =>
      attacks.where((e) => e.contains(self)).toList();

  void onArmyAttack({
    required Player attacker,
    required Player defender,
  }) =>
      AttackDialog.army(
        defender: defender,
        max: self.armies,
        onAccept: (amount) => armyAttack(
          attacker: attacker,
          defender: defender,
          amount: amount,
        ),
      );

  void armyAttack({
    required Player attacker,
    required Player defender,
    required int amount,
  }) {
    attacker.removeArmies(amount);

    attacks.add(ArmyAttack.from(
      attacker: attacker,
      defender: defender,
      amount: amount,
    ));

    onArmyUsed(attacker);
  }

  void onMissileAttack({
    required Player attacker,
    required Player defender,
  }) =>
      AttackDialog.missile(
        defender: defender,
        max: self.attackMissiles,
        missileYield: attacker.attackMissileYield,
        onAccept: (amount) => missileAttack(
          attacker: attacker,
          defender: defender,
          amount: amount,
        ),
      );

  void missileAttack({
    required Player attacker,
    required Player defender,
    required int amount,
  }) {
    attacker.removeAttackMissiles(amount);

    attacks.add(MissileAttack.from(
      attacker: attacker,
      defender: defender,
      amount: amount,
      ktPerMissile: attacker.attackMissileYield,
    ));

    onAttackMissileUsed(attacker);
  }

  // ============================= UPDATE =================================== \\

  void update(double dt) {
    timeElapsed += dt;

    for (final Player player in players) {
      player.update(dt);
    }

    _updateAttacks(
      dt: dt,
      attacks: attacks,
      callback: (attack) => _processEvents(attack.resolve()),
    );
  }

  void _updateAttacks({
    required double dt,
    required List<Attack> attacks,
    required Function(Attack) callback,
  }) {
    fps.update(dt);
    final List<Attack> tasksToRemove = [];

    for (final Attack task in attacks) {
      if (task.update(dt)) {
        callback(task);
        tasksToRemove.add(task);
      }
    }

    for (final Attack task in tasksToRemove) {
      attacks.remove(task);
    }
  }
}
