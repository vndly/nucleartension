import 'dart:ui';
import 'package:nucleartension/domain/models/region.dart';

class Battlefield {
  final String id;
  final Size size;
  final List<Region> regions;

  const Battlefield({
    required this.id,
    required this.size,
    required this.regions,
  });

  double get ratio => size.width / size.height;
}
