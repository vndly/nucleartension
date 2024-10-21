import 'dart:ui';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/region.dart';

class Battlefield {
  final Size size;
  final List<Region> regions;

  const Battlefield({
    required this.size,
    required this.regions,
  });

  double get ratio => size.width / size.height;

  List<Region> playerRegions(Player player) =>
      regions.where((region) => region.player == player).toList();
}
