import 'package:nucleartension/extensions/military_map_extension.dart';
import 'package:nucleartension/models/inventory/base_inventory.dart';
import 'package:nucleartension/types/military_type.dart';

class MilitaryInventory extends BaseInventory<MilitaryType> {
  MilitaryInventory._(super.items);

  factory MilitaryInventory.empty() => MilitaryInventory._({});

  factory MilitaryInventory.create(MilitaryMap resources) =>
      MilitaryInventory._(resources);
}
