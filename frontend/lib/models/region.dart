import 'package:flutter/rendering.dart';
import 'package:nucleartension/models/players/player.dart';

class Region {
  final Offset offset;
  final double radius;
  final Player? player;

  Region({
    required this.offset,
    required this.radius,
    this.player,
  });
}
