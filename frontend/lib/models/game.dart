import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/dialog/attack_dialog.dart';
import 'package:nucleartension/models/attacks/attack.dart';
import 'package:nucleartension/models/attacks/missile_attack.dart';
import 'package:nucleartension/models/attacks/unit_attack.dart';
import 'package:nucleartension/models/events/defcon_update_event.dart';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/events/missile_attack_launch_event.dart';
import 'package:nucleartension/models/events/player_defeated_event.dart';
import 'package:nucleartension/models/events/unit_attack_launch_event.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/players/self_player.dart';
import 'package:nucleartension/states/game_state.dart';
import 'package:nucleartension/utils/custom_snackbar.dart';
import 'package:nucleartension/utils/fps.dart';

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

  List<Player> get playersByMilitary {
    final List<Player> result = List.from(players);
    result.sort((a, b) => b.militaryPower - a.militaryPower);

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

  void setPlayers(List<Player> list) {
    players.addAll(list);
    selfPlayer = list.whereType<SelfPlayer>().first;
  }

  // ============================= EVENTS =================================== \\

  bool get hasUnseenEvents => events.any((e) => !e.seen);

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

  void onUnitCreated(Player player) => _applyDefcon(
        player: player,
        level: 4,
      );

  void onUnitUsed(Player player) => _applyDefcon(
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

  void onUnitAttack({
    required Player attacker,
    required Player defender,
  }) =>
      AttackDialog.military(
        max: self.militaryPower,
        onAccept: (amount) => _unitAttack(
          attacker: attacker,
          defender: defender,
          militaryPower: amount,
        ),
      );

  void _unitAttack({
    required Player attacker,
    required Player defender,
    required int militaryPower,
  }) {
    attacker.removeMilitaryPower(militaryPower);

    attacks.add(UnitAttack.from(
      attacker: attacker,
      defender: defender,
      militaryPower: militaryPower,
    ));

    _addEvent(UnitAttackLaunchEvent(
      attacker: attacker,
      defender: defender,
      militaryPower: militaryPower,
    ));

    onUnitUsed(attacker);
  }

  void onMissileAttack({
    required Player attacker,
    required Player defender,
  }) =>
      AttackDialog.missiles(
        max: self.militaryAttackMissiles,
        missileYield: attacker.attackMissileYield,
        onAccept: (amount) => _missileAttack(
          attacker: attacker,
          defender: defender,
          amount: amount,
        ),
      );

  void _missileAttack({
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

    _addEvent(MissileAttackLaunchEvent(
      attacker: attacker,
      defender: defender,
      totalMissiles: amount,
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
