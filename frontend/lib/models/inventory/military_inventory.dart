import 'package:nucleartension/extensions/item_map_extension.dart';
import 'package:nucleartension/models/inventory/base_inventory.dart';
import 'package:nucleartension/types/military_type.dart';

typedef MilitaryMap = ItemMap<MilitaryType>;

typedef MilitaryMapEntry = MapEntry<MilitaryType, num>;

class MilitaryInventory extends BaseInventory<MilitaryType> {
  MilitaryInventory._(super.items);

  factory MilitaryInventory.empty() => MilitaryInventory._({});

  factory MilitaryInventory.create(MilitaryMap resources) =>
      MilitaryInventory._(resources);
}
