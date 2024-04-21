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
}
