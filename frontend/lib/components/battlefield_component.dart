import 'package:flame/components.dart';
import 'package:nucleartension/components/region_component.dart';
import 'package:nucleartension/models/battlefield.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/region.dart';

class BattlefieldComponent extends World {
  final Game game;
  final Battlefield battlefield;

  BattlefieldComponent({
    required this.game,
    required this.battlefield,
  });

  @override
  Future onLoad() async {
    for (final Region region in battlefield.regions) {
      add(RegionComponent(
        game: game,
        region: region,
        position: region.position,
        size: Vector2.all(region.radius * 2),
      ));
    }
  }
}
