import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/base.dart';
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
      child: ResourcesSection(state.base),
    );
  }
}

class ResourcesSection extends StatelessWidget {
  final Base base;

  const ResourcesSection(this.base);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResourceLabel(
          base: base,
          resourceType: ResourceType.energy,
        ),
        const VBox(10),
        ResourceLabel(
          base: base,
          resourceType: ResourceType.supplies,
        ),
        const VBox(10),
        ResourceLabel(
          base: base,
          resourceType: ResourceType.population,
        ),
        const VBox(10),
        ResourceLabel(
          base: base,
          resourceType: ResourceType.technology,
        ),
      ],
    );
  }
}

class ResourceLabel extends StatelessWidget {
  final Base base;
  final ResourceType resourceType;

  const ResourceLabel({
    required this.base,
    required this.resourceType,
  });

  @override
  Widget build(BuildContext context) {
    final num amount = base.resourceInventory.get(resourceType);
    final String production =
        '${Formatter.production(base.productionOf(resourceType))}/s';

    return LabeledText(
      label: '${resourceType.name.toUpperCase()}:',
      text: '${Formatter.resource(amount)} ($production)',
      labelColor: Palette.text,
      textColor: Palette.text,
    );
  }
}
