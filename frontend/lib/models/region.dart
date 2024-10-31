import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/models/players/player.dart';

class Region {
  final String id;
  final Vector2 position;
  final double radius;
  final int totalSlots;
  Player? player;
  num population = 0;
  int propaganda = 0;
  int siloLevel = 0;
  int defenseMissiles = 0;
  int attackMissiles = 0;

  Region({
    required this.id,
    required this.position,
    required this.radius,
    required this.totalSlots,
    required this.population,
    required this.propaganda,
    this.player,
  });

  bool get isNeutral => player == null;

  Color get color => player?.country.color ?? Colors.grey;

  bool belongsTo(Player player) => this.player == player;

  void upgradePropaganda() {
    propaganda++;
  }

  void update(double dt) {
    if (propaganda > 0) {
      population += propaganda * dt * Constants.PROPAGANDA_RATE_PER_LEVEL;
    }
  }
}
