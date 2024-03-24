import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/states/game_state.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/labeled_text.dart';

class HeaderBlock extends StatelessWidget {
  final GameState state;

  const HeaderBlock(this.state);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ResourcesSection(state.game),
    );
  }
}

class ResourcesSection extends StatelessWidget {
  final Game game;

  const ResourcesSection(this.game);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResourceLabel(
          game: game,
          resourceType: ResourceType.energy,
        ),
        const VBox(10),
        ResourceLabel(
          game: game,
          resourceType: ResourceType.supplies,
        ),
        const VBox(10),
        ResourceLabel(
          game: game,
          resourceType: ResourceType.population,
        ),
        const VBox(10),
        ResourceLabel(
          game: game,
          resourceType: ResourceType.technology,
        ),
      ],
    );
  }
}

class ResourceLabel extends StatelessWidget {
  final Game game;
  final ResourceType resourceType;

  const ResourceLabel({
    required this.game,
    required this.resourceType,
  });

  @override
  Widget build(BuildContext context) {
    final num amount = game.resourceInventory.get(resourceType);
    final String production =
        '${Formatter.production(game.productionOf(resourceType))}/s';

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          resourceType.icon,
          size: 14,
          color: Palette.icon,
        ),
        const HBox(10),
        LabeledText(
          label: '${resourceType.name.toUpperCase()}:',
          text: '${Formatter.resource(amount)} ($production)',
          labelColor: Palette.text,
          textColor: Palette.text,
        ),
      ],
    );
  }
}
