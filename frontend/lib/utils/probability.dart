import 'dart:math';

class Probability {
  static Random random = Random();

  static bool succeeds(num probability) => random.nextDouble() < probability;

  static T choose<T>(Map<T, num> probabilities) {
    final num randomNumber = random.nextDouble();
    num cumulativeWeight = 0;

    for (final MapEntry<T, num> entry in probabilities.entries) {
      cumulativeWeight += entry.value;

      if (randomNumber < cumulativeWeight) {
        return entry.key;
      }
    }

    throw Exception('Cannot pick an item from $probabilities');
  }

  static int between(int min, int max) => random.nextInt(max) + min;

  static T? element<T>(List<T> list) =>
      list.isNotEmpty ? list[random.nextInt(list.length)] : null;

  static bool equals(num actual, num expected) =>
      (expected - actual).abs() < 0.01;
}
