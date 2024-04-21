import 'dart:math';

class Probability {
  static Random random = Random();

  static bool succeeds(num probability) => random.nextDouble() < probability;
}
