typedef ItemMap<T> = Map<T, num>;

typedef ItemMapEntry<T> = MapEntry<T, num>;

extension ItemMapExtension<T> on ItemMap<T> {
  bool contains(T type) => keys.contains(type);

  num get(T type) => this[type] ?? 0;

  void set(T type, num value) => this[type] = value;

  num get duration {
    num sum = 0;

    for (final MapEntry<T, num> item in entries) {
      sum += item.value;
    }

    return sum;
  }

  Map<T, num> multiply(num factor) {
    final Map<T, num> result = {};

    for (final MapEntry<T, num> item in entries) {
      result[item.key] = item.value * factor;
    }

    return result;
  }
}
