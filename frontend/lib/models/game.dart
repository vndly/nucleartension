import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:nucleartension/components/battlefield_component.dart';
import 'package:nucleartension/dialog/attack_dialog.dart';
import 'package:nucleartension/models/attacks/attack.dart';
import 'package:nucleartension/models/attacks/missile_attack.dart';
import 'package:nucleartension/models/battlefield.dart';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/events/player_defeated_event.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/players/self_player.dart';
import 'package:nucleartension/models/region.dart';
import 'package:nucleartension/states/game_state.dart';
import 'package:nucleartension/utils/fps.dart';
import 'package:nucleartension/utils/probability.dart';

class Game extends FlameGame with TapCallbacks {
  final GameState state;
  final Battlefield battlefield;
  final List<Player> players;
  final List<Event> events;
  final List<Attack> attacks;
  final FPS fps = FPS();
  Player? selfPlayer;
  num timeElapsed = 0;
  int defcon = 5;

  Game({
    required this.state,
    required this.battlefield,
    required this.players,
    required this.events,
    required this.attacks,
    required this.timeElapsed,
    required this.defcon,
  }) : super(
          camera: CameraComponent.withFixedResolution(
            width: battlefield.size.width,
            height: battlefield.size.height,
          ),
        ) {
    world = BattlefieldComponent(
      game: this,
      battlefield: battlefield,
    );
    debugMode = false;
  }

  // ============================= REGIONS ================================== \\

  void onNeutralRegionSelected(Region region) {}

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
        state.onPlayerLost(killer!);
      } else if (playersAlive.length == 1) {
        state.onPlayerWon();
      }
    }
  }

  // ============================ MILITARY ================================== \\

  List<Attack> get selfAttacks =>
      attacks.where((e) => e.contains(self)).toList();

  void onMissileAttack({
    required Player attacker,
    required Player defender,
  }) =>
      AttackDialog.missile(
        defender: defender,
        max: 0,
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
    //attacker.removeAttackMissiles(amount);

    attacks.add(MissileAttack.from(
      attacker: attacker,
      defender: defender,
      amount: amount,
      ktPerMissile: attacker.attackMissileYield,
    ));
  }

  // ============================= UPDATE =================================== \\

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

  @override
  void update(double dt) {
    super.update(dt);
    timeElapsed += dt;

    for (final Player player in players) {
      player.update(dt);
    }

    battlefield.update(dt);
    fps.update(dt);

    _updateAttacks(
      dt: dt,
      attacks: attacks,
      callback: (attack) => _processEvents(attack.resolve()),
    );
  }

  @override
  void onTapUp(TapUpEvent event) {
    // unselect all regions
  }
}
