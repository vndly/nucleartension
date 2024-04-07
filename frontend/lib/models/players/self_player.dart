import 'package:nucleartension/models/players/player.dart';

class SelfPlayer extends Player {
  const SelfPlayer({
    required super.game,
    required super.name,
    required super.color,
    required super.resources,
    required super.buildings,
    required super.researches,
    required super.military,
  });
}
