import 'package:nucleartension/models/players/player.dart';

class ActivePlayer extends Player {
  const ActivePlayer({
    required super.game,
    required super.name,
    required super.resources,
    required super.buildings,
    required super.military,
  });
}
