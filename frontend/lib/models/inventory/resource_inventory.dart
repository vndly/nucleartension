import 'package:nucleartension/extensions/resource_map_extension.dart';
import 'package:nucleartension/types/resource_type.dart';

class ResourceInventory {
  final ResourceMap _items;

  ResourceInventory(this._items);

  bool get isEmpty => _items.isEmpty;

  num get(ResourceType type) => _items.get(type);

  void add(ResourceType type, num amount) {
    _items[type] = get(type) + amount;
  }

  void remove(ResourceType type, num amount) {
    _items[type] = get(type) - amount;
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

  bool has(ResourceType type, num amount) => get(type) >= amount;

  bool hasType(ResourceType type) => get(type) != 0;

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
