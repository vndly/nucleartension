import 'package:nucleartension/extensions/resource_map_extension.dart';
import 'package:nucleartension/types/resource_type.dart';

class ResourceInventory {
  final ResourceMap _items;

  ResourceInventory(this._items);

  bool get isEmpty => _items.isEmpty;

  num get(ResourceType resourceType) => _items.get(resourceType);

  void add(ResourceType resourceType, num amount) {
    _items[resourceType] = get(resourceType) + amount;
  }

  void remove(ResourceType resourceType, num amount) {
    _items[resourceType] = get(resourceType) - amount;
  }

  void addItem(ResourceMapEntry item) => add(item.key, item.value);

  void removeItem(ResourceMapEntry item) => remove(item.key, item.value);

  void addItems(ResourceMap map) {
    for (final ResourceMapEntry item in map.entries) {
      addItem(item);
    }
  }

  void removeItems(ResourceMap map) {
    for (final ResourceMapEntry item in map.entries) {
      removeItem(item);
    }
  }

  void addInventory(ResourceInventory inventory) => addItems(inventory._items);

  void removeInventory(ResourceInventory inventory) =>
      removeItems(inventory._items);

  bool has(ResourceType resourceType, num amount) =>
      get(resourceType) >= amount;

  bool hasType(ResourceType resourceType) => get(resourceType) != 0;

  bool hasItem(ResourceMapEntry item) => has(item.key, item.value);

  bool hasItems(ResourceMap map) {
    for (final ResourceMapEntry item in map.entries) {
      if (!hasItem(item)) {
        return false;
      }
    }

    return true;
  }
}
