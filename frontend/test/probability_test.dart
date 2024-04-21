import 'package:flutter_test/flutter_test.dart';
import 'package:nucleartension/utils/probability.dart';

void main() {
  test('Defense missile effectiveness', () {
    const num effectiveness = 0.6;
    const int limit = 10000;
    int success = 0;

    for (int i = 0; i < limit; i++) {
      if (Probability.succeeds(effectiveness)) {
        success++;
      }
    }

    final num successRate = success / limit;
    expect((successRate - effectiveness).abs() < 0.1, true);
  });

  test('Probabilities', () {
    const int limit = 10000;
    const Map<String, num> probabilities = {
      'A': 0.4,
      'B': 0.3,
      'C': 0.2,
      'D': 0.1,
    };
    final Map<String, int> hits = {
      'A': 0,
      'B': 0,
      'C': 0,
      'D': 0,
    };

    for (int i = 0; i < limit; i++) {
      final String chosen = Probability.choose(probabilities);
      hits[chosen] = (hits[chosen] ?? 0) + 1;
    }

    final Map<String, num> results = {};

    for (final String key in probabilities.keys) {
      final num successRate = hits[key]! / limit;
      results[key] = successRate;
      expect((successRate - probabilities[key]!).abs() < 0.1, true);
    }
  });
}
