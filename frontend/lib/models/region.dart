import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/players/player.dart';

class Region {
  final String id;
  final Vector2 position;
  final double radius;
  Player? player;
  bool selected = false;

  Region({
    required this.id,
    required this.position,
    required this.radius,
    this.player,
  });

  Color get color => player?.country.color ?? Colors.grey;

  void onTap() {
    selected = !selected;
  }
}
