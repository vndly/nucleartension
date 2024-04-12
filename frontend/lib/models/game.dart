import 'package:nucleartension/models/attacks/attack.dart';
import 'package:nucleartension/models/attacks/unit_attack.dart';
import 'package:nucleartension/models/events/defcon_update_event.dart';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/events/unit_attack_outgoing_event.dart';
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

  void setPlayers(List<Player> list) {
    players.addAll(list);
    selfPlayer = list.whereType<SelfPlayer>().first;
  }

  // ============================= EVENTS =================================== \\

  bool get hasUnseenEvents => events.any((e) => !e.seen);

  void addEvent(Event event) => events.insert(0, event);

  // ============================= DEFCON =================================== \\

  void onMilitaryCreated() => _applyDefcon(4);

  void onMilitaryUsed() => _applyDefcon(3);

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

  void onAttackPlayerMilitary(Player defender) {
    final int militaryPower = self.militaryPower;
    self.removeMilitaryPower(militaryPower);

    attacks.add(UnitAttack.from(
      attacker: self,
      defender: defender,
      militaryPower: militaryPower,
    ));

    addEvent(UnitAttackOutgoing(
      defender: defender,
      militaryPower: militaryPower,
    ));

    onMilitaryUsed();
  }

  void onAttackPlayerMissiles(Player player) {}

  // ============================= UPDATE =================================== \\

  void update(double dt) {
    timeElapsed += dt;

    for (final Player player in players) {
      player.update(dt);
    }

    for (final Attack attack in attacks) {
      attack.update(dt);
    }
  }
}
