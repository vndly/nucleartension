import 'package:flutter/material.dart';
import 'package:nucleartension/extensions/resource_map_extension.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/resource_indicator.dart';

class CostIndicator extends StatelessWidget {
  final Game game;
  final ResourceMap cost;

  const CostIndicator({
    required this.game,
    required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
              textColor: game.resourceInventory.hasItem(resource)
                  ? Palette.text
                  : Palette.error,
              textSize: 16,
            ),
          ),
      ],
    );
  }
}
