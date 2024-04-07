import 'package:nucleartension/extensions/item_map_extension.dart';
import 'package:nucleartension/types/resource_type.dart';

typedef ResourceMap = ItemMap<ResourceType>;

typedef ResourceMapEntry = MapEntry<ResourceType, num>;

extension ResourceMapExtension on ResourceMap {
  ResourceMap multiply(int factor) {
    final ResourceMap result = {};

    for (final ResourceMapEntry item in entries) {
      result[item.key] = item.value * factor;
    }

    return result;
  }
}
