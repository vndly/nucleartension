import 'package:nucleartension/extensions/resource_map_extension.dart';

class Task {
  num totalTime = 0;
  num remainingTime = 0;
  final ResourceMap cost;

  Task({
    required this.cost,
    required num duration,
  }) {
    totalTime = duration;
    remainingTime = totalTime;
  }

  double get progress => 1 - (remainingTime / totalTime);

  bool get isCompleted => remainingTime <= 0;

  bool update(double dt) {
    remainingTime -= dt;

    return isCompleted;
  }
}
