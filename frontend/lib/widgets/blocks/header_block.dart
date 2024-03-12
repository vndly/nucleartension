import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/colony.dart';
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
      child: ResourcesSection(state.colony),
    );
  }
}

class ResourcesSection extends StatelessWidget {
  final Colony colony;

  const ResourcesSection(this.colony);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResourceLabel(
          colony: colony,
          resourceType: ResourceType.energy,
        ),
        const VBox(10),
        ResourceLabel(
          colony: colony,
          resourceType: ResourceType.supplies,
        ),
        const VBox(10),
        ResourceLabel(
          colony: colony,
          resourceType: ResourceType.population,
        ),
        const VBox(10),
        ResourceLabel(
          colony: colony,
          resourceType: ResourceType.technology,
        ),
      ],
    );
  }
}

class ResourceLabel extends StatelessWidget {
  final Colony colony;
  final ResourceType resourceType;

  const ResourceLabel({
    required this.colony,
    required this.resourceType,
  });

  @override
  Widget build(BuildContext context) {
    final num amount = colony.resourceInventory.get(resourceType);
    final String production =
        '${Formatter.production(colony.productionOf(resourceType))}/s';

    return LabeledText(
      label: '${resourceType.name.toUpperCase()}:',
      text: '${Formatter.resource(amount)} ($production)',
      labelColor: Palette.black,
      textColor: Palette.black,
    );
  }
}
