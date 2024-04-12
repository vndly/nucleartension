import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/event_type.dart';

class PlayerDefeated extends Event {
  final Player player;

  PlayerDefeated({
    required this.player,
  }) : super(eventType: EventType.player_defeated);

  @override
  List<String> get text => ['PLAYER DEFEATED: ${player.name}'];
}
