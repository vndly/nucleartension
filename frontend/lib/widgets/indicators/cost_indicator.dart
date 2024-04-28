import 'package:flutter/material.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/resource_indicator.dart';

class CostIndicator extends StatelessWidget {
  final Player player;
  final ResourceMap cost;

  const CostIndicator({
    required this.player,
    required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final ResourceMapEntry resource in cost.entries)
          Padding(
            padding: const EdgeInsets.only(
              top: 2,
              bottom: 2,
            ),
            child: ResourceIndicator(
              icon: resource.key.icon(16),
              value: Formatter.resource(resource.value),
              textColor: player.resources.hasItem(resource)
                  ? Palette.textPrimary
                  : Palette.error,
              textSize: 16,
            ),
          ),
      ],
    );
  }
}
