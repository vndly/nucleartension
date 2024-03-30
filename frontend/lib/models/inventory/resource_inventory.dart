import 'package:nucleartension/extensions/resource_map_extension.dart';
import 'package:nucleartension/types/resource_type.dart';

class ResourceInventory {
  final ResourceMap _items;

  ResourceInventory(this._items);

  bool get isEmpty {
    for (final ResourceMapEntry item in _items.entries) {
      if (item.value != 0) {
        return false;
      }
    }

    return true;
  }

  num get(ResourceType type) => _items.get(type);

  void add(ResourceType type, num amount) {
    final num current = get(type);
    _items[type] = current + amount;
  }

  void remove(ResourceType type, num amount) {
    final num current = get(type);
    _items[type] = current - amount;
  }

  void addItem(ResourceMapEntry item) => add(item.key, item.value);

  void removeItem(ResourceMapEntry item) => remove(item.key, item.value);

  void addItems(ResourceMap map) {
    for (final ResourceMapEntry item in map.entries) {
      add(item.key, item.value);
    }
  }

  void removeItems(ResourceMap map) {
    for (final ResourceMapEntry item in map.entries) {
      remove(item.key, item.value);
    }
  }

  void addInventory(ResourceInventory inventory) => addItems(inventory._items);

  void removeInventory(ResourceInventory inventory) =>
      removeItems(inventory._items);

  bool hasType(ResourceType type) => _items[type] != null;

  bool has(ResourceType type, num amount) => get(type) >= amount;

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
