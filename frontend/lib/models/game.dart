import 'package:nucleartension/models/attacks/attack.dart';
import 'package:nucleartension/models/attacks/missile_attack.dart';
import 'package:nucleartension/models/attacks/unit_attack.dart';
import 'package:nucleartension/models/events/defcon_update_event.dart';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/events/missile_attack_launch_event.dart';
import 'package:nucleartension/models/events/unit_attack_launch_event.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/players/self_player.dart';
import 'package:nucleartension/utils/custom_snackbar.dart';

class Game {
  final List<Player> players;
  final List<Event> events;
  final List<Attack> attacks;
  Player? selfPlayer;
  num timeElapsed = 0;
  int defcon = 5;

  Game({
    required this.players,
    required this.events,
    required this.attacks,
    required this.timeElapsed,
    required this.defcon,
  });

  int get defconStep => 6 - defcon;

  Player get self => selfPlayer!;

  List<Player> get playersByAlive {
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

  List<Player> get playersByTechnology {
    final List<Player> result = List.from(players);
    result.sort((a, b) => b.technologyLevel - a.technologyLevel);

    return result;
  }

  void setPlayers(List<Player> list) {
    players.addAll(list);
    selfPlayer = list.whereType<SelfPlayer>().first;
  }

  // ============================= EVENTS =================================== \\

  bool get hasUnseenEvents => events.any((e) => !e.seen);

  void addEvent(Event event) => events.insert(0, event);

  // ============================= DEFCON =================================== \\

  void onUnitCreated() => _applyDefcon(4);

  void onUnitUsed() => _applyDefcon(3);

  void onAttackMissileCreated() => _applyDefcon(2);

  void onAttackMissileUsed() => _applyDefcon(1);

  void _applyDefcon(int value) {
    if (defcon > value) {
      defcon = value;
      CustomSnackbar.defcon(value);
      addEvent(DefconUpdateEvent(
        defconLevel: defcon,
      ));
    }
  }

  // ============================ MILITARY ================================== \\

  List<Attack> get selfAttacks =>
      attacks.where((e) => e.contains(self)).toList();

  void onUnitAttack({
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

    addEvent(UnitAttackLaunchEvent(
      attacker: attacker,
      defender: defender,
      militaryPower: militaryPower,
    ));

    onUnitUsed();
  }

  void onMissileAttack({
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

    addEvent(MissileAttackLaunchEvent(
      attacker: attacker,
      defender: defender,
      totalMissiles: amount,
      ktPerMissile: attacker.attackMissileYield,
    ));

    onAttackMissileUsed();
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
      callback: (attack) => attack.resolve().forEach(addEvent),
    );
  }

  void _updateAttacks({
    required double dt,
    required List<Attack> attacks,
    required Function(Attack) callback,
  }) {
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
