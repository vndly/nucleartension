import 'package:flutter/rendering.dart';
import 'package:nucleartension/models/players/player.dart';

class Region2 {
  final Offset offset;
  final double radius;
  final Player? player;

  Region2({
    required this.offset,
    required this.radius,
    this.player,
  });
}
