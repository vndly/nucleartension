import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:nucleartension/domain/components/battlefield_component.dart';
import 'package:nucleartension/domain/models/battlefield.dart';
import 'package:nucleartension/domain/models/region.dart';
import 'package:nucleartension/domain/states/game_state.dart';

class Game extends FlameGame with TapCallbacks {
  final GameState state;
  final Battlefield battlefield;
  num timeElapsed = 0;

  Game({
    required this.state,
    required this.battlefield,
    required this.timeElapsed,
  }) : super(
         camera: CameraComponent.withFixedResolution(
           width: battlefield.size.width,
           height: battlefield.size.height,
         ),
       ) {
    world = BattlefieldComponent(game: this, battlefield: battlefield);
    debugMode = false;
  }

  // ============================= REGIONS ================================== \\

  void onNeutralRegionSelected(Region region) {}

  @override
  void update(double dt) {
    super.update(dt);
    timeElapsed += dt;
  }

  @override
  void onTapUp(TapUpEvent event) => unselectAllRegions();

  void unselectAllRegions() {
    final BattlefieldComponent battlefieldComponent =
        world as BattlefieldComponent;
    battlefieldComponent.unselectAllRegions();
  }
}
