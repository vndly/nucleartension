import 'package:nucleartension/models/players/player.dart';

class PassivePlayer extends Player {
  const PassivePlayer({
    required super.game,
    required super.name,
    required super.country,
    required super.resources,
    required super.military,
    required super.buildings,
    required super.researches,
  });
}
