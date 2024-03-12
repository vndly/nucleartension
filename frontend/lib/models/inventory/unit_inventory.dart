import 'package:nucleartension/extensions/unit_map_extension.dart';
import 'package:nucleartension/models/inventory/base_inventory.dart';
import 'package:nucleartension/types/unit_type.dart';

class UnitInventory extends BaseInventory<UnitType> {
  UnitInventory._(super.stockpile, super.capacities);

  factory UnitInventory.empty() => UnitInventory._({}, {});

  factory UnitInventory.create({
    required UnitMap units,
    required UnitMap capacities,
  }) {
    final UnitMap unitMap = {};
    final UnitMap capacitiesMap = {};

    for (final UnitMapEntry unit in units.entries) {
      unitMap[unit.key] = unit.value;
      capacitiesMap[unit.key] = capacities[unit.key] ?? 0;
    }

    return UnitInventory._(unitMap, capacitiesMap);
  }
}
