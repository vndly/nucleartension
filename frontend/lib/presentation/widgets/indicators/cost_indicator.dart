import 'package:flutter/material.dart';
import 'package:nucleartension/domain/models/players/player.dart';
import 'package:nucleartension/presentation/widgets/labels/resource_indicator.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/palette.dart';

class CostIndicator extends StatelessWidget {
  final Player player;
  final int cost;

  const CostIndicator({required this.player, required this.cost});

  @override
  Widget build(BuildContext context) {
    return ResourceIndicator(
      icon: const Icon(Icons.bolt, color: Palette.resourceEnergy, size: 14),
      value: Formatter.resource(cost),
      textColor: player.energy >= cost ? Palette.textPrimary : Palette.error,
      textSize: 16,
    );
  }
}
