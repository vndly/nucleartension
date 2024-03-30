import 'package:nucleartension/models/inventory/base_inventory.dart';
import 'package:nucleartension/types/resource_type.dart';

class ResourceInventory extends BaseInventory<ResourceType> {
  ResourceInventory(super.items);

  factory ResourceInventory.empty() => ResourceInventory({});
}
