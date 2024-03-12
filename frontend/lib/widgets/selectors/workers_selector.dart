import 'package:flutter/material.dart';
import 'package:nucleartension/models/buildings/producers/producer.dart';
import 'package:nucleartension/utils/assets.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/selectors/amount_selector.dart';

class WorkersSelector extends StatelessWidget {
  final Producer building;
  final double size;

  const WorkersSelector({
    required this.building,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return AmountSelector(
      text:
          '${Formatter.resource(building.villagers)}/${Formatter.resource(building.maxWorkersCapacity)}',
      color: (building.villagers == 0) ? Palette.error : Palette.black,
      size: size,
      image: Assets.IMAGES_UNITS_VILLAGER,
      onRemove: building.canRemoveVillagers ? building.removeVillagers : null,
      onAdd: building.canAddVillagers ? building.addVillager : null,
    );
  }
}
