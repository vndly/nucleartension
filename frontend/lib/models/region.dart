import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/players/player.dart';

class Region {
  final String id;
  final Vector2 position;
  final double radius;
  final int totalSlots;
  Player? player;
  bool selected = false;
  int population = 0;
  int siloLevel = 0;
  int defenseMissiles = 0;
  int attackMissiles = 0;

  Region({
    required this.id,
    required this.position,
    required this.radius,
    required this.totalSlots,
    required this.population,
    this.player,
  });

  bool get isNeutral => player == null;

  Color get color => player?.country.color ?? Colors.grey;

  bool belongsTo(Player player) => this.player == player;

  void onTap() {
    selected = !selected;
  }
}
