import 'dart:ui';
import 'package:nucleartension/extensions/item_map_extension.dart';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/event_type.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/palette.dart';

class PlayerDefeated extends Event {
  final Player player;
  final Player killer;
  final ResourceMap loot;

  PlayerDefeated({
    required this.player,
    required this.killer,
    required this.loot,
  }) : super(eventType: EventType.player_defeated);

  @override
  bool get show => true;

  @override
  Color get titleColor => Palette.eventOther;

  @override
  List<String> get text => [
        Localized.get.eventPlayerDefeatedLine1(player.name, killer.name),
        if (killer.isSelf) ...[
          Localized.get.eventPlayerDefeatedLine2,
          Localized.get.eventPlayerDefeatedLine3(
            Formatter.resourceRaw(loot.get(ResourceType.energy)),
          ),
        ],
      ];
}
