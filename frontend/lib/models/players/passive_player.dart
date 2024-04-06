import 'package:nucleartension/models/players/player.dart';

class PassivePlayer extends Player {
  const PassivePlayer({
    required super.game,
    required super.name,
    required super.resources,
    required super.buildings,
    required super.researches,
    required super.military,
  });
}
