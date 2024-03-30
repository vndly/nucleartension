import 'package:nucleartension/models/buildings/building.dart';

abstract class Trainer extends Building {
  Trainer({
    required super.buildingType,
    required super.player,
    required super.level,
  });

  /*@override
  void update(double dt) {
    super.update(dt);
  }*/
}
