import 'package:nucleartension/extensions/resource_map_extension.dart';
import 'package:nucleartension/models/inventory/base_inventory.dart';
import 'package:nucleartension/types/resource_type.dart';

class ResourceInventory extends BaseInventory<ResourceType> {
  ResourceInventory._(super.items);

  factory ResourceInventory.empty() => ResourceInventory._({});

  factory ResourceInventory.create(ResourceMap resources) =>
      ResourceInventory._(resources);
}
