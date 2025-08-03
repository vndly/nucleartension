import 'package:nucleartension/domain/models/players/player.dart';

class SelfPlayer extends Player {
  SelfPlayer({
    required super.game,
    required super.name,
    required super.country,
    required super.researches,
    required super.energy,
  });
}
