import 'package:nucleartension/extensions/item_map_extension.dart';
import 'package:nucleartension/models/inventory/base_inventory.dart';
import 'package:nucleartension/types/resource_type.dart';

typedef ResourceMap = ItemMap<ResourceType>;

typedef ResourceMapEntry = MapEntry<ResourceType, num>;

class ResourceInventory extends BaseInventory<ResourceType> {
  ResourceInventory._(super.items);

  factory ResourceInventory.create(ResourceMap resources) =>
      ResourceInventory._(resources);
}
