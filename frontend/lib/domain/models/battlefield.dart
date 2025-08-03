import 'dart:ui';
import 'package:nucleartension/domain/models/players/player.dart';
import 'package:nucleartension/domain/models/region.dart';

class Battlefield {
  final Size size;
  final List<Region> regions;

  const Battlefield({required this.size, required this.regions});

  double get ratio => size.width / size.height;

  List<Region> playerRegions(Player player) =>
      regions.where((region) => region.player == player).toList();

  void update(double dt) {
    for (final region in regions) {
      region.update(dt);
    }
  }
}
