import 'package:nucleartension/extensions/resource_map_extension.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/utils/assets.dart';

enum MissileType {
  attack(
    sprite: Assets.IMAGES_MISSILES_ATTACK,
    cost: {
      ResourceType.energy: 20,
      ResourceType.supplies: 20,
    },
  ),
  defense(
    sprite: Assets.IMAGES_MISSILES_DEFENSE,
    cost: {
      ResourceType.energy: 20,
      ResourceType.supplies: 20,
    },
  );

  final String sprite;
  final ResourceMap cost;

  const MissileType({
    required this.sprite,
    required this.cost,
  });

  @override
  String toString() => name.replaceAll('_', ' ');
}
