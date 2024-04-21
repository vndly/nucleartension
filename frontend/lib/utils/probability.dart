import 'dart:math';

class Probability {
  static Random random = Random();

  static bool succeeds(num probability) => random.nextDouble() < probability;

  static T choose<T>(Map<T, num> probabilities) {
    return probabilities.keys.first;
  }
}
