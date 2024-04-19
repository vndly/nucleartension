import 'dart:math';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Defense missile effectiveness', () {
    const num effectiveness = 0.6;
    const int limit = 10000;
    final Random random = Random();
    int success = 0;

    for (int i = 0; i < limit; i++) {
      if (random.nextDouble() < effectiveness) {
        success++;
      }
    }

    final num successRate = success / limit;
    print(successRate);

    expect((successRate - effectiveness).abs() < 0.1, true);
  });
}
