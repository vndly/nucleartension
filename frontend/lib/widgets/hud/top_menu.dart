import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/states/game_state.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class TopMenu extends StatelessWidget {
  final GameState state;

  const TopMenu(this.state);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ResourceLabel(
        player: state.game.self,
        resourceType: ResourceType.energy,
      ),
    );
  }
}

class ResourceLabel extends StatelessWidget {
  final Player player;
  final ResourceType resourceType;

  const ResourceLabel({
    required this.player,
    required this.resourceType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        resourceType.icon(14),
        const HBox(10),
        Label(
          text: Formatter.resource(player.resources.get(resourceType)),
          color: Palette.textPrimary,
          size: 14,
        ),
      ],
    );
  }
}
