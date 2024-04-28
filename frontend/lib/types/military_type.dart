import 'package:nucleartension/extensions/item_map_extension.dart';
import 'package:nucleartension/models/inventory/resource_inventory.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/research_type.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/assets.dart';
import 'package:nucleartension/utils/localizations.dart';

enum MilitaryType {
  troop(
    sprite: Assets.IMAGES_UNITS_INFANTRY, // TODO(momo): change
    cost: {
      ResourceType.energy: 20,
      ResourceType.supplies: 20,
    },
  ),
  missile_defense(
    sprite: Assets.IMAGES_MISSILES_DEFENSE,
    cost: {
      ResourceType.energy: 60,
      ResourceType.supplies: 20,
    },
  ),
  missile_attack(
    sprite: Assets.IMAGES_MISSILES_ATTACK,
    cost: {
      ResourceType.energy: 80,
      ResourceType.supplies: 40,
    },
  );

  final String sprite;
  final ResourceMap cost;

  const MilitaryType({
    required this.sprite,
    required this.cost,
  });

  ResourceMap effectiveCost(Player player) {
    final Research research = player.getResearch(researchCost);

    return cost.multiply(research.decreaseRate);
  }

  num effectiveDuration(Player player) {
    final Research research = player.getResearch(researchTime);

    return (cost.duration * research.decreaseRate) / 10;
  }

  String get localized {
    switch (this) {
      case troop:
        return Localized.get.typeMilitaryTroopName;
      case missile_defense:
        return Localized.get.typeMilitaryDefenseMissileName;
      case missile_attack:
        return Localized.get.typeMilitaryAttackMissileName;
    }
  }

  List<String> get description {
    switch (this) {
      case troop:
        return [
          Localized.get.typeMilitaryTroopDescription,
        ];
      case missile_defense:
        return [
          Localized.get.typeMilitaryDefenseMissileDescription1,
          '',
          Localized.get.typeMilitaryDefenseMissileDescription2,
        ];
      case missile_attack:
        return [
          Localized.get.typeMilitaryAttackMissileDescription1,
          '',
          Localized.get.typeMilitaryAttackMissileDescription2,
        ];
    }
  }

  ResearchType get researchCost {
    switch (this) {
      case troop:
        return ResearchType.military_cost;
      case missile_defense:
      case missile_attack:
        return ResearchType.missiles_additive_manufacturing;
    }
  }

  ResearchType get researchTime {
    switch (this) {
      case troop:
        return ResearchType.military_time;
      case missile_defense:
      case missile_attack:
        return ResearchType.missiles_assembly_automation;
    }
  }
}
