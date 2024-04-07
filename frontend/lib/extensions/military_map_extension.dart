import 'package:nucleartension/extensions/item_map_extension.dart';
import 'package:nucleartension/types/military_type.dart';

typedef MilitaryMap = ItemMap<MilitaryType>;

typedef MilitaryMapEntry = MapEntry<MilitaryType, num>;

extension MilitaryMapExtension on MilitaryMap {
  num get duration {
    num sum = 0;

    for (final MilitaryMapEntry item in entries) {
      sum += item.value;
    }

    return sum / 10;
  }

  MilitaryMap multiply(int factor) {
    final MilitaryMap result = {};

    for (final MilitaryMapEntry item in entries) {
      result[item.key] = item.value * factor;
    }

    return result;
  }
}
