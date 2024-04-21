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
}
