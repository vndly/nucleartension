import 'package:nucleartension/types/resource_type.dart';

typedef ResourceMap = Map<ResourceType, num>;

typedef ResourceMapEntry = MapEntry<ResourceType, num>;

extension ResourceMapExtension on ResourceMap {
  bool contains(ResourceType type) => keys.contains(type);

  num get(ResourceType type) => this[type] ?? 0;

  bool get isEmpty {
    for (final ResourceMapEntry item in entries) {
      if (item.value != 0) {
        return false;
      }
    }

    return true;
  }

  num get duration {
    num sum = 0;

    for (final ResourceMapEntry item in entries) {
      sum += item.value;
    }

    return sum / 10;
  }

  ResourceMap multiply(int factor) {
    final ResourceMap result = {};

    for (final ResourceMapEntry item in entries) {
      result[item.key] = item.value * factor;
    }

    return result;
  }
}
